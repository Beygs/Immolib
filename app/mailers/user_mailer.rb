class UserMailer < ApplicationMailer
  default from: ENV['EMAIL_FROM']
 
  def welcome_email(user)
    @user = user 
    @subtitle = "Bienvenue ๐"
    mail(to: @user.email, subject: "Bienvenue sur immolib ๐") 
  end

  def new_property_validation_email(property)
    @property = property
    @user = property.owner
    @subtitle = "Confirmation de la crรฉation de votre logement immolib ๐"
    mail(to: @user.email, subject: "Confirmation de la crรฉation de votre logement immolib ๐")
  end

  def new_appointment_validation_email(appointment)
    @appointment = appointment
    @user = appointment.candidate
    @subtitle = "Confirmation de votre visite ๐"
    mail(to: @user.email, subject: "Confirmation de votre visite ๐")
  end

  def candidate_folder_reminder_email(appointment)
    @appointment = appointment
    @user = appointment.candidate
    @subtitle = "Votre dossier de location est incomplet ๐"
    mail(to: @user.email, subject: "Votre dossier de location est incomplet ๐")
  end

  def appointment_reminder_email(appointment)
    @appointment = appointment
    @user = appointment.candidate
    @subtitle = "J-1 avant votre visite โฐ"
    mail(to: @user.email, subject: "J-1 avant votre visite โฐ")
  end

end
