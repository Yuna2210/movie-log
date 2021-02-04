class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.valid?
      ContactMailer.send_for_admin(@contact).deliver_now
      redirect_to root_path, notice: "Your message has been sent. Thank you!"
    else
      render 'new'
    end
  end

  private

  def contact_params
    params.require(:contact).permit(
      :name,
      :email,
      :subject,
      :message
    )
  end
end
