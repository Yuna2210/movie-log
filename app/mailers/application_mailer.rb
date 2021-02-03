class ApplicationMailer < ActionMailer::Base
  default from: %("#{Rails.configuration.x.site.title}" <#{Rails.configuration.x.site.email}>)
  layout 'mailer'
end
