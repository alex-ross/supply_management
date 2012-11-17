require "minitest_helper"

describe Supplier do
  let(:supplier) { Factory.create :supplier }

  it { supplier.must_respond_to :address }
  it { supplier.must_respond_to :city }
  it { supplier.must_respond_to :country }
  it { supplier.must_respond_to :zip }
  it { supplier.must_respond_to :email }
  it { supplier.must_respond_to :phone }
  it { supplier.must_respond_to :name }
  it { supplier.must_respond_to :url }

  #TODO: test validations
end

