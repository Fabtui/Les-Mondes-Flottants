require 'rails_helper'

RSpec.describe User, :type => :model do
  it "is valid with valid attributes" do
    user = create(:user)
    expect(user).to be_valid
  end

  it "is not valid without a name" do
    user = User.new(address: "23 Rue Thier, 06000 Nice", name: nil, password: "azerty", email:"toto@mail.com")
    expect(user).to_not be_valid
  end

  it "is not valid without a address" do
    user = User.new(address: nil, name: 'Toto', password: "azerty", email:"toto@mail.com")
    expect(user).to_not be_valid
  end

  it "is not valid without a correctly formated mail" do
    user = User.new(address: "23 Rue Thier, 06000 Nice", name: 'Toto', password: "azerty", email:"toto@mail")
    expect(user).to_not be_valid
  end
end
