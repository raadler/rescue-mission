require 'rails_helper'

feature "User deletes a question" do
  let!(:q1) { Question.create(title: "#{Faker::Lorem.sentence(10)}", description: "#{Faker::Lorem.paragraph(6, true)}") }
  let!(:q2) { Question.create(title: "#{Faker::Lorem.sentence(10)}", description: "#{Faker::Lorem.paragraph(6, true)}") }
  let!(:a1) { Answer.create(description: "#{Faker::Lorem.paragraph(3, true)}", question: q1) }
  let!(:a2) { Answer.create(description: "#{Faker::Lorem.paragraph(3, true)}", question: q1) }

  scenario "User deletes a question from the question show page" do
    visit question_path(q1)
    click_on "Delete Question"

    expect(page).to have_content "Question deleted!"
    expect(page).to have_current_path questions_path
    expect(page).not_to have_content q1.title
  end

  scenario "User deletes a question from the question edit page" do
    visit edit_question_path(q2)
    click_button "Delete Question"

    expect(page).to have_content "Question deleted!"
    expect(page).to have_current_path questions_path
    expect(page).not_to have_content q2.title
  end
end
