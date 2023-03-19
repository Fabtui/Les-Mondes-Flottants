class AppointmentsController < ApplicationController

  def create
    appointment = Appointment.new(appointment_params)
    appointment.artist_id = params[:artist_id]
    appointment.user_id = current_user.id
    if appointment.save
      redirect_to artist_path(params[:artist_id]), notice: "Votre rendez-vous a bien été enregistré"
    else
      redirect_to artist_path(params[:artist_id]), alert: "Une erreur c'est produite, votre rendez-vous n'a pas pu être enregistré"
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:date, :comment, :category)
  end
end