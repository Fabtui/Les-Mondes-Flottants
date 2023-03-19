class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[loading home]

  def loading
    @shop = Shop.first
  end

  def home
    @shop = Shop.first
  end
end
