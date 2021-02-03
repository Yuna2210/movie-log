class ContactMailer < ApplicationMailer

  def send_for_admin(contact_item)
    @contact = contact_item
    mail to: Rails.configuration.x.site.admin_mail, subject: "[movie-log] message from user"
  end
end
