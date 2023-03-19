class ArtistsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show ]

  def show
    @artist = User.artists.find(params[:id])
    @appointments = @artist.artist_appointments.pluck(:date).map{ |d| d.strftime('%F')}.join('$')
    @appointment = Appointment.new
  end
end
