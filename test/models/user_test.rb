require "minitest_helper"

describe User do
  let(:user) { Factory.create :user }

  it { user.must_respond_to :email }
  it { user.must_respond_to :password_confirmation }
  it { user.must_respond_to :remember_me }

  #TODO: Test validations
end