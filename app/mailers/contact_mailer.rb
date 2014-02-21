class ContactMailer < ActionMailer::Base
    default to: "arcadiabakery@gmail.com"

    def contact_us(contact_form, email_body)
        @contact_form = contact_form

        mail(from: @contact_form.email,             
            body: email_body,
            reply_to: @contact_form.email,
            content_type: "text/html",
            subject: "Virthium Contact Form Message from: #{@contact_form.name}, email: #{@contact_form.email}")
    end
end

