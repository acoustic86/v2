class ContactFormController< ApplicationController
  
  
  def new
    @contact_form = ContactForm.new
  end
  
  def send_email
    @contact_form = ContactForm.new(params[:contact_form])
    if @contact_form.valid?
      ContactMailer.contact_us(@contact_form, @contact_form.note).deliver
      redirect_to root_path, :notice => "Thank you! Your message was sent successfully. We will contact you shortly."
    else
      flash.now[:error] = "Hmm. We couldn't send your message. Please double check the fields and make sure the form is filled out correctly."
      render :new
    end
  end
end