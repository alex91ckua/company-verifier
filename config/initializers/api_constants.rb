# API_ENDPOINT = 'https://gtmetrix-gtmetrix.p.mashape.com'
API_ENDPOINT = 'https://gtmetrix.com/api/0.1'
if Rails.env.production?
  MASHAPE_KEY = ENV['MASHAPE_KEY']
  AUTH_KEY = ENV['AUTH_KEY']
else
  MASHAPE_KEY = 'SrZo6u3CT9mshZeqDPwRhCqEmQOzp1rftvCjsnBpcSn03sUIpH'
  AUTH_KEY = 'am9zaEBqbWFya2V0aW5nLmNvbS5hdTo3OGE5MTczZDQ0N2EzMGIyYTVjMzNjZDQ5ZjExMGY4Yg=='
end
