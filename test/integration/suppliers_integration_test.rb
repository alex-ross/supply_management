require "minitest_helper"

describe "Suppliers integration" do
  let(:user) { Factory.create :user }
  let(:supplier) { Factory.create :supplier }

  it "sign in user" do
    visit suppliers_path
    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    click_button "Sign in"
  end

  describe "in index page" do
    it "should list all suppliers" do
      supplier1 = Factory.create :supplier
      supplier2 = Factory.create :supplier
      visit suppliers_path
      page.text.must_include supplier1.name
      page.text.must_include supplier2.name
    end
  end

  describe "in show page" do
    it "should view suppliers address" do
      visit supplier_path(supplier)
      page.text.must_include supplier.address
      page.text.must_include supplier.zip
      page.text.must_include supplier.city
      page.text.must_include supplier.country
    end
  end

  describe "when createing an new supplier" do
    it "should redirect to form when information is invalid" do
      visit new_supplier_path
      fill_in "Name", with: "New Supplier"
      click_button "Save"
      page.has_selector?('#error_explanation')
      page.has_selector?("title", text: "New supplier")
    end

    it "should redirect to index when information is valid" do
      visit new_supplier_path
      fill_in "Name", with: "New Supplier"
      fill_in "Address", with: "Storgatan 11"
      fill_in "City", with: "F%e4rjestaden"
      fill_in "Country", with: "Sverige"
      click_button "Save"
      page.has_selector?("title", text: "Suppliers")
    end
  end
end