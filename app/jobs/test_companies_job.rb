class TestCompaniesJob < ApplicationJob
  queue_as :default

  def perform(testing_job)
    if testing_job.class == TestingJob
      require 'unirest'
      url = "https://gtmetrix.com/api/0.1/test/#{testing_job.test_id}"

      response = Unirest.get url,
                             headers:{
                                 'Authorization' => 'Basic am9zaEBqbWFya2V0aW5nLmNvbS5hdTo3OGE5MTczZDQ0N2EzMGIyYTVjMzNjZDQ5ZjExMGY4Yg==',
                                 'X-Mashape-Key' => 'SrZo6u3CT9mshZeqDPwRhCqEmQOzp1rftvCjsnBpcSn03sUIpH',
                                 'Content-Type' => 'application/x-www-form-urlencoded',
                                 'Accept' => 'application/json'
                             }

      p response

      if response.body['state'] == 'completed'
        results = response.body['results']
        GtMetrixTest.create(
            :company => testing_job.company,
            :page_load_time => results['page_load_time'],
            :pagespeed_score => results['pagespeed_score'],
            :yslow_score => results['yslow_score'],
            :fully_loaded_time => results['fully_loaded_time'],
            :report_url => results['report_url']
            )
        # testroy test job after success
        testing_job.destroy
      else
        # re-check it again in 1 min
        TestCompaniesJob.set(wait: 1.minute).perform_later(testing_job)
      end
    end
  end

end
