require 'spec_helper'

describe Question do
  it "should validate title length" do
    should validate_length_of(:title).
    is_at_least(40).
    on(:create)
  end
end
