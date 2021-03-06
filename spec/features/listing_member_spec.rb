require "rails_helper"

RSpec.feature "Listing members" do
  before do
    @john = User.create(first_name: "John", last_name: "Doe", email: "john@doe.com", password: "password")
    @sarah = User.create(first_name: "Sarah", last_name: "Joseph", email: "sarah@joseph.com", password: "password")
  end

  scenario "shows a list of registered members" do
    visit "/"
    expect(page).to have_content("List of members")
    expect(page).to have_content(@john.full_name)
    expect(page).to have_content(@sarah.full_name)
  end
end
