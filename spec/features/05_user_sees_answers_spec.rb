require 'rails_helper'

feature "User sees answers to a question" do
  let!(:q1) { Question.create(title: "#{Faker::Lorem.sentence(10)}", description: "#{Faker::Lorem.paragraph(6, true)}") }

  let!(:q2) { Question.create(title: "#{Faker::Lorem.sentence(10)}", description: "#{Faker::Lorem.paragraph(6, true)}") }

  let!(:a1) { Answer.create(description: "#{Faker::Lorem.paragraph(3, true)}", question: q1) }

  let!(:a2) { Answer.create(description: "#{Faker::Lorem.paragraph(3, true)}", question: q1) }

  let!(:a3) { Answer.create(description: "#{Faker::Lorem.paragraph(3, true)}", question: q1) }

  let!(:a4) { Answer.create(description: "#{Faker::Lorem.paragraph(3, true)}", question: q2) }

  scenario "User views answers to a given question" do
    visit question_path(q1)

    expect(page).to have_content(a1.description)
    expect(page).to have_content(a2.description)
    expect(page).to have_content(a3.description)
    expect(page).not_to have_content(a4.description)
  end

  scenario "Answers are in chronological order" do
    visit question_path(q1)

    first_question_position = page.body.index(a1.description)
    second_question_position = page.body.index(a2.description)
    third_question_position = page.body.index(a3.description)

    expect(first_question_position).to be < second_question_position
    expect(second_question_position).to be < third_question_position
  end

end
