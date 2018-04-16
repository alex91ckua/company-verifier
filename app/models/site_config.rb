# RailsSettings Model
class SiteConfig < RailsSettings::Base
  source Rails.root.join("config/app.yml")
  namespace Rails.env
end
