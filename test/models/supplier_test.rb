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
  it { supplier.must_respond_to :note }
  it { supplier.must_respond_to :gmaps4rails_address }

  describe "categories" do
    before { supplier.category_names = "bread, milk, meat" }
    it { supplier.categories.count.must_equal 3 }
    it "can be get as string (without whitespace)" do
      supplier.category_names.must_equal "bread,milk,meat"
    end
    describe "when saved with one more category" do
      before { supplier.category_names = "bread, milk, meat, egg" }
      it { supplier.categories.count.must_equal 4 }
      it "can be get as string (without whitespace)" do
        supplier.category_names.must_equal "bread,milk,meat,egg"
      end
    end
  end

  describe "validations" do
    it { supplier.valid?.must_equal true }

    it "must have an name" do
      supplier.name = " "
      supplier.invalid?(:name).must_equal true
    end

    it "must have an address" do
      supplier.address = " "
      supplier.invalid?(:address).must_equal true
    end

    it "must have an city" do
      supplier.city = " "
      supplier.invalid?(:city).must_equal true
    end

    it "must have an country" do
      supplier.country = " "
      supplier.invalid?(:country).must_equal true
    end
  end
end

