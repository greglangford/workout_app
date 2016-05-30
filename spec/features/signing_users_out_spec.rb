require "rails_helper"

RSpec.feature do "User signs out"
  before do
    @user = User.create!(email: "test@example.com", password: "password")

    visit "/"

    click_link "Sign In"
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_button "Log in"
  end

  scenario do
    visit "/"

    click_link "Sign Out"
    expect(page).to have_content("Signed out successfully.")
  end
end
