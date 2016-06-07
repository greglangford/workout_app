require "rails_helper"

RSpec.feature "Deleting exercise" do
  before do
    @owner = User.create(email: "owner@example.com", password: "password")

    @owner_exercise = @owner.exercises.create!(duration_in_min: 48, workout: "cardio special", workout_date: Date.today)

    login_as(@owner)
  end

  scenario do
    visit "/"
    click_link "My Lounge"

    link = "//a[contains(@href, '/users/#{@owner.id}/exercises/#{@owner_exercise.id}') and .//text()='Destroy']"
    find(:xpath, link).click

    expect(page).to have_content("Exercise has been deleted")
  end
end
