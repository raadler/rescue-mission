require 'rails_helper'

describe Question do
  it "should validate question title length" do
    should validate_length_of(:title).
    is_at_least(40).
    on(:create)
  end

  it "should validate question description length" do
    should validate_length_of(:description).
    is_at_least(150).
    on(:create)
  end

  it "should have many answers" do
    should have_many(:answers)
  end

end
