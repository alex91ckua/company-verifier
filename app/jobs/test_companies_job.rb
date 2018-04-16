class TestCompaniesJob < ApplicationJob
  queue_as :default

  def perform(testing_job)
    if testing_job.class == TestingJob
      require 'unirest'
      url = "https://gtmetrix.com/api/0.1/test/#{testing_job.test_id}"

      response = Unirest.get url, headers: {
        'Authorization' => 'Basic am9zaEBqbWFya2V0aW5nLmNvbS5hdTo3OGE5MTczZDQ0N2EzMGIyYTVjMzNjZDQ5ZjExMGY4Yg==',
        'X-Mashape-Key' => 'SrZo6u3CT9mshZeqDPwRhCqEmQOzp1rftvCjsnBpcSn03sUIpH',
        'Content-Type' => 'application/x-www-form-urlencoded',
        'Accept' => 'application/json'
      }

      # p response

      if response.body['state'] == 'queued' || response.body['state'] == 'started'
        # re-check it again after 1 min
        TestCompaniesJob.set(wait: 1.minute).perform_later(testing_job)
        TestLog.create(company: testing_job.company, message: "State is '#{response.body['state']}', I'll re-check it 1 min")
      elsif response.body['state'] == 'completed'
        # Add test test to db on success
        results = response.body['results']
        GtMetrixTest.create(
            :company => testing_job.company,
            :page_load_time => results['page_load_time'],
            :pagespeed_score => results['pagespeed_score'],
            :yslow_score => results['yslow_score'],
            :fully_loaded_time => results['fully_loaded_time'],
            :report_url => results['report_url'],
            :state => response.body['state']
        )
        # testroy test job after success
        testing_job.destroy
        TestLog.create(company: testing_job.company, message: 'Test was completed and added to database')
      else
        # some error
        GtMetrixTest.create :company => testing_job.company, :state => response.body['error']
        testing_job.destroy
        TestLog.create(company: testing_job.company, message: "Can't test the company, error: #{response.body['error']}")
      end

    end
  end

end
