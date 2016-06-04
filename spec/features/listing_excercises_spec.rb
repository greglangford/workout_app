require "rails_helper"

RSpec.feature "Listing excercises" do
  before do
    @user = User.create(email: "test@example.com", password: "password")
    login_as(@user)

    @e1 = @user.exercises.create(duration_in_min: 20, workout: "body building", workout_date: "2015-08-09")
    @e2 = @user.exercises.create(duration_in_min: 20, workout: "cardio", workout_date: "2015-08-10")
  end

  scenario "shows users workouts for the last 7 days" do
    visit "/"

    click_link "My Lounge"

    expect(page).to have_content(@e1.duration_in_min)
    expect(page).to have_content(@e1.workout)
    expect(page).to have_content(@e1.workout_date)
    expect(page).to have_content(@e2.duration_in_min)
    expect(page).to have_content(@e2.workout)
    expect(page).to have_content(@e2.workout_date)
  end
end
