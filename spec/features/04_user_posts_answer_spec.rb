require 'rails_helper'

feature "User posts an answer" do
  let!(:q1) { Question.create(title: "#{Faker::Lorem.sentence(10)}", description: "#{Faker::Lorem.paragraph(6, true)}") }

  scenario "User successfully answers a question" do
    visit question_path(q1)

    fill_in "Answer", with: "Stop letting the cats run across the keyboard; put it away as soon as you see a cat."
    click_button "Submit Answer"

    expect(page).to have_content("Stop letting the cats run across the keyboard; put it away as soon as you see a cat.")
    expect(page).to have_content("Answer successfully submitted!")
  end

  scenario "User's answer is too short" do
    visit question_path(q1)
    fill_in "Answer", with: "This answer is too short."
    click_button "Submit Answer"

    expect(page).to have_content("Description is too short (minimum is 50 characters)")
  end

end
