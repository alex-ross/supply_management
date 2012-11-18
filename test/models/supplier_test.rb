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
  it { supplier.must_respond_to :categories }
  it { supplier.must_respond_to :gmaps4rails_address }


  it "cud have categories" do
    c1 = Factory.create :category
    c2 = Factory.build :category
    [c1, c2].each { |c| supplier.add_category(c) }
    supplier.categories.count.must_equal 2
  end
end

