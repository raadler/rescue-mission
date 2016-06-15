require 'rails_helper'


feature "User views questions page" do
    let!(:q1) { Question.create(title: "#{Faker::Lorem.sentence(10)}", description: "#{Faker::Lorem.paragraph(6, true)}") }
    let!(:q2) { Question.create(title: "#{Faker::Lorem.sentence(10)}", description: "#{Faker::Lorem.paragraph(6, true)}") }
    let!(:q3) { Question.create(title: "#{Faker::Lorem.sentence(10)}", description: "#{Faker::Lorem.paragraph(6, true)}") }

  scenario "views questions list" do
    visit '/questions'
    expect(page).to have_content q1.title
    expect(page).to have_content q2.title
    expect(page).to have_content q3.title
  end

  scenario "views questions in reverse chronological order" do
    visit '/questions'
    first_question_position = page.body.index(q3.title)
    second_question_position = page.body.index(q2.title)
    third_question_position = page.body.index(q1.title)

    expect(first_question_position).to be < second_question_position
    expect(second_question_position).to be < third_question_position
  end
end
