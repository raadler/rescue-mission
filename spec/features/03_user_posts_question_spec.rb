require 'rails_helper'

feature "User posts a question" do

  scenario "User successfully enters question" do
    visit new_question_path
    fill_in "Title", with: "Why does my computer have all these blinky lights?"
    fill_in "Description", with: "I have no clue what any of this does. Why am I in a boot camp? Why is everything the way it is? I don't know what I'm doing. Help, please, help!!!!!!!"
    click_button "Create Question"

    expect(page).to have_content("Question successfully created!")
    expect(page).to have_content("Why does my computer have all these blinky lights?")
    expect(page).to have_content("I have no clue what any of this does. Why am I in a boot camp? Why is everything the way it is? I don't know what I'm doing. Help, please, help!!!!!!!")
  end

  scenario "User doesn't fill out any info and tries to submit form" do
    visit new_question_path
    click_button "Create Question"

    expect(page).to have_content("Title is too short (minimum is 40 characters)")
    expect(page).to have_content("Description is too short (minimum is 150 characters)")
  end

  scenario "User fills out info but doesn't have enough characters" do
    visit new_question_path
    fill_in "Title", with: "Title"
    fill_in "Description", with: "Description"
    click_button "Create Question"

    expect(page).to have_content("Title is too short (minimum is 40 characters)")
    expect(page).to have_content("Description is too short (minimum is 150 characters)")
  end
end
