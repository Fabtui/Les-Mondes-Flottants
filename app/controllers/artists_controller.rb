class ArtistsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show ]

  def show
    @artist = User.artists.find(params[:id])
    @appointment = Appointment.new
  end
end
