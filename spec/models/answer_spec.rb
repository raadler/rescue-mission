require 'rails_helper'

describe Answer do
  it "should validate answer description length" do
    should validate_length_of(:description).
    is_at_least(50).
    on(:create)
  end

  it "validates presence of question" do
    should validate_presence_of(:question)
  end

  it "should belong to a question" do
    should belong_to(:question)
  end

end
