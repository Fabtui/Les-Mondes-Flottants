class FlashesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @flashes = Flash.all.order(:created_at).reverse
  end
end
