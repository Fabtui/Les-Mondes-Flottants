require 'rails_helper'

RSpec.describe Tattoo, :type => :model do
  it "is valid with valid attributes" do
    user = create(:user)
    user.artist = true
    user.save
    tattoo = Tattoo.new(user_id: user.id)
    tattoo.photo.attach(io: File.open('app/assets/images/tattoos/tattoo5.jpg'), filename: 'geo.jpg', content_type:'image/jpg')
    expect(tattoo).to be_valid
  end

  it "is not valid without a user" do
    tattoo = Tattoo.new
    tattoo.photo.attach(io: File.open('app/assets/images/tattoos/tattoo5.jpg'), filename: 'geo.jpg', content_type:'image/jpg')
    expect(tattoo).to_not be_valid
  end

  it "is not valid without an artist user" do
    user = create(:user)
    tattoo = Tattoo.new(user_id: user.id)
    tattoo.photo.attach(io: File.open('app/assets/images/tattoos/tattoo5.jpg'), filename: 'geo.jpg', content_type:'image/jpg')
    expect(tattoo).to_not be_valid
  end

  it "is not valid without a photo" do
    user = create(:user)
    user.artist = true
    user.save
    tattoo = Tattoo.new(user_id: user.id)
    expect(tattoo).to_not be_valid
  end
  # it "is not valid without a description"
  # it "is not valid without a start_date"
  # it "is not valid without a end_date"
end
