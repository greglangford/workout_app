require "rails_helper"

RSpec.feature "Listing excercises" do
  before do
    @user = User.create(first_name: "John", last_name: "Doe", email: "test@example.com", password: "password")
    @user1 = User.create(first_name: "Sarah", last_name: "Doe", email: "sarah@example.com", password: "password")
    login_as(@user)

    @e1 = @user.exercises.create(duration_in_min: 20, workout: "body building", workout_date: Date.today)
    @e2 = @user.exercises.create(duration_in_min: 20, workout: "cardio", workout_date: Date.today)

    @following = Friendship.create(user: @user, friend: @user1)
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

  scenario "shows a list of users friends" do
    visit "/"

    click_link("My Lounge")
    expect(page).to have_content("My Friends")
    expect(page).to have_link(@user1.full_name)
    expect(page).to have_link("Unfollow")
  end
end
