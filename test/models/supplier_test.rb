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

  describe "categories" do
    before { supplier.category_names = "bread, milk, meat" }
    it { supplier.categories.count.must_equal 3 }
    it "can be get as string (without whitespace)" do
      supplier.category_names.must_equal "bread,milk,meat"
    end
  end
end

