require 'rails_helper'

feature "User views question page" do
  let!(:q1) { Question.create(title: "#{Faker::Hipster.sentence(10)}", description: "#{Faker::Hipster.paragraph(6, true)}") }

  scenario "clicks on a question title from main page and sees question page" do
    visit '/questions'
    click_on "#{q1.title}"
    expect(page).to have_current_path(question_path(q1))
  end

  scenario "views questions list" do
    visit question_path(q1)
    expect(page).to have_content "#{q1.title}"
    expect(page).to have_content "#{q1.description}"
  end

end
