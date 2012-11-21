require "minitest_helper"

describe User do
  let(:user) { Factory.create :user }

  it { user.must_respond_to :email }
  it { user.must_respond_to :password_confirmation }
  it { user.must_respond_to :remember_me }
  it { user.must_respond_to :address }
  it { user.must_respond_to :zip }
  it { user.must_respond_to :city }
  it { user.must_respond_to :country }
  it { user.valid?.must_equal true}

  it "can be invalid" do
    invalid_user = Factory.build :user, password_confirmation: "WrongPassword"
    invalid_user.valid?.must_equal false
  end
end