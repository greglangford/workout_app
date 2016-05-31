require "rails_helper"

RSpec.feature "Creating exercise" do
  before do
    @user = User.create!(email: "example@example.com", password: "password")
    login_as(@user)
  end

  scenario "with valid input" do
    visit "/"

    click_link "My Lounge"
    click_link "New Workout"
    expect(page).to have_link("Back")

    fill_in "Duration", with: 70
    fill_in "Workout Details", with: "Weight lifting"
    fill_in "Activity date", with: "2015-08-07"
    click_button "Create Exercise"

    expect(page).to have_content("Exercise has been created")

    exercise = Exercise.last
    expect(current_path).to eq(user_exercise_path(@user, exercise))
  end
end
