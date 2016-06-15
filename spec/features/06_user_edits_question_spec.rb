require 'rails_helper'

feature "User edits a question" do
  let!(:q1) { Question.create(title: "#{Faker::Lorem.sentence(10)}", description: "#{Faker::Lorem.paragraph(6, true)}") }
  let(:edited_title) { "#{Faker::Lorem.sentence(10)}" }
  let(:edited_description) { "#{Faker::Lorem.paragraph(6, true)}" }

  scenario "User clicks on edit link from question show page" do
    visit question_path(q1)
    click_on "Edit Question"
    expect(page).to have_current_path(edit_question_path(q1))
    expect(page).to have_content "Edit Question:"
  end

  scenario "User successfully edits question from question edit page" do
    visit edit_question_path(q1)
    fill_in "Title", with: edited_title
    fill_in "Description", with: edited_description
    click_button "Update Question"

    expect(page).to have_current_path(question_path(q1))
    expect(page).to have_content edited_title
    expect(page).to have_content edited_description
  end

  scenario "User unsuccessfully edits question because fields are too short" do
    visit edit_question_path(q1)
    fill_in "Title", with: "Title"
    fill_in "Description", with: "Description"
    click_button "Update Question"

    expect(page).to have_content("Edit Question:")
    expect(page).to have_content("Title is too short (minimum is 40 characters)")
    expect(page).to have_content("Description is too short (minimum is 150 characters)")
  end
end
