class ArtistsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show ]

  def show
    @artist = User.artists.find(params[:id])
    # @appointments = @artist.artist_appointments.pluck(:date).map{ |d| d.strftime('%F')}.join('$')
    @appointments = @artist.artist_appointments.pluck(:date).join('$').gsub(' ', '_')
    @appointment = Appointment.new
    @tattoos = @artist.tattoos
    @flashes = @artist.flashes
  end
end
