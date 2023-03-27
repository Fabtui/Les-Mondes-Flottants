class AppointmentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :create ]

  def show
    @appointment = Appointment.find(params[:id])
    @shop = Shop.first
    event_link_description = "Rendez-vous #{@appointment.category} #{@shop.name}. #{@shop.address}.
    Pour toute modification ou annulation merci de nous contacter au #{@shop.phone}."
    @event_link = "https://calendar.google.com/calendar/u/0/r/eventedit?text=RDV #{@shop.name}&details=#{event_link_description}&location=#{@shop.address}&dates=#{(@appointment.date - 7200).strftime("%Y%m%dT%H%M%SZ")}/#{(@appointment.date - 3600).strftime("%Y%m%dT%H%M%SZ")}&ctz=Europe/Europe"
  end

  def create
    appointment = Appointment.new(appointment_params)
    appointment.artist_id = params[:artist_id]
    appointment.user_id = current_user.id if current_user
    appointment.duration = 1
    if appointment.save
      redirect_to appointment_path(appointment.id), confirm: "Votre rendez-vous a bien été enregistré"
    else
      redirect_to artist_path(params[:artist_id]), alert: "Une erreur c'est produite, votre rendez-vous n'a pas pu être enregistré"
    end
  end



  private

  def appointment_params
    params.require(:appointment).permit(:date, :comment, :category, :name, :email, :phone)
  end
end
