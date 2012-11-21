require "minitest_helper"

describe "Suppliers integration" do
  let(:user) { Factory.create :user }

  it "sign in user" do
    visit suppliers_path
    if current_path == new_user_session_path
      fill_in "Email", with: user.email
      fill_in "Password", with: "password"
      click_button "Sign in"
    end
  end

  it "should redirect to suppliers after submit" do
    visit settings_path(locale: "en")
    current_path == settings_path
    fill_in "Address", with: "Storgatan 11"
    fill_in "City", with: "Farjestaden"
    fill_in "Zip", with: "12345"
    fill_in "Country", with: "Sverige"
    click_button "Save"
    page.has_selector?("title", text: "Suppliers")
  end
end