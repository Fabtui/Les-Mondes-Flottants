class AppointmentMailer < ApplicationMailer
  def appointment_confirmation_user_email(appointment, shop)
    @appointment = appointment
    @shop = shop
    event_link_description = "Rendez-vous #{appointment.category} avec #{appointment.artist.name}. #{Shop.first.name} - #{Shop.first.address}. Pour toute modification ou annulation merci de nous contacter au #{Shop.first.phone}."
    @event_link = "https://calendar.google.com/calendar/u/0/r/eventedit?text=RDV #{Shop.first.name}&details=#{event_link_description}&location=#{Shop.first.address}&dates=#{(appointment.date - 7200).strftime("%Y%m%dT%H%M%SZ")}/#{(appointment.date - 3600).strftime("%Y%m%dT%H%M%SZ")}&ctz=Europe/Europe".gsub(' ', '%20')
    mail(to: @appointment.email, subject: "Coonfirmation rendez-vous #{Shop.first.name}")
  end

  def appointment_confirmation_shop_email(appointment, shop)
    @appointment = appointment
    @shop = shop
    event_link_description = "Rendez-vous #{appointment.category} avec #{appointment.name}."
    @event_link = "https://calendar.google.com/calendar/u/0/r/eventedit?text=RDV #{Shop.first.name}&details=#{event_link_description}&location=#{Shop.first.address}&dates=#{(appointment.date - 7200).strftime("%Y%m%dT%H%M%SZ")}/#{(appointment.date - 3600).strftime("%Y%m%dT%H%M%SZ")}&ctz=Europe/Europe".gsub(' ', '%20')
    mail(to: @shop.email, subject: 'Nouveau rendez-vous')
  end
end
