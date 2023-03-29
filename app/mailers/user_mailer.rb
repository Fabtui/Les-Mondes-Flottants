class UserMailer < ApplicationMailer
  def welcome_user_email(user, shop)
    @user = user
    @shop = shop
    mail(to: @user.email, subject: "Bienvenu #{user.name} - #{shop.name}")
  end
end
