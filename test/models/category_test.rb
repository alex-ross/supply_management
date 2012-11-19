require "minitest_helper"

describe Category do

  let(:category) { Factory.create :category }

  it { category.must_respond_to :name }
  it { category.must_respond_to :suppliers }

  it "rejects when name is not present" do
    category.name = " "
    category.invalid?(:name).must_equal true
  end

  describe "must be saved whitout whitespace" do
    bread = Factory.create :category, name: "bread "
    it { bread.name.must_equal "bread" }
  end
end