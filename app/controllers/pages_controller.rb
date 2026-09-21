class PagesController < ApplicationController
  def home
  end

  def about
  end

  def menu
  end

  def gallery
  end

  def contact
  end

  def create_contact
    @name = params[:name].to_s.strip
    @email = params[:email].to_s.strip
    @phone = params[:phone].to_s.strip
    @message = params[:message].to_s.strip

    errors = []
    errors << "Name is required." if @name.blank?
    errors << "Email is required." if @email.blank?
    errors << "Please enter a valid email." if @email.present? && @email !~ /\A[^@\s]+@[^@\s]+\.[^@\s]+\z/
    errors << "Message is required." if @message.blank?

    if errors.any?
      flash.now[:alert] = errors.join(" ")
      render :contact, status: :unprocessable_entity
    else
      flash[:notice] = "Thank you, #{@name}! Your message has been received. We’ll get back to you soon. (Placeholder — no email is sent yet.)"
      redirect_to contact_path
    end
  end

  def privacy
  end

  def terms
  end
end
