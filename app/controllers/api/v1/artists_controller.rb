class Api::V1::ArtistsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show, :index ]

  def index
    @artists = User.artists
    render json: @artists
  end

  def show
    @artist = User.artists.find(params[:id])
    @appointments = @artist.artist_appointments
    @appointment = Appointment.new
    render json: [artist: @artist, appointments: @appointments]
  end
end
