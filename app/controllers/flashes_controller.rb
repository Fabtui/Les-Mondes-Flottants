class FlashesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    if params[:artist]
      @flashes = Flash.where(user_id: params[:artist]).order(date: :desc)
    else
      @flashes = Flash.all.order(date: :desc)
    end
  end
end
