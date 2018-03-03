class ApplicationMailer < ActionMailer::Base
  default from: ENV['POSTMARK_SENDER_EMAIL'] || 'welcome@uskillity.de'
  layout 'mailer'
end
