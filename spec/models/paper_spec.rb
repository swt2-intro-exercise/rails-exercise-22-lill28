require 'rails_helper'

RSpec.describe Paper, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  it "should be invalid when any attribute is missing" do
    paper1 = Paper.new(title:"", venue:"a venue", year:"1234")
    paper2 = Paper.new(title:"a title", venue:"", year:"1234")
    paper3 = Paper.new(title:"a title", venue:"a venue", year:"")
    paper4 = Paper.new(title:"a title", venue:"a venue", year:"hululululu")
    expect(paper1).to_not be_valid
    expect(paper2).to_not be_valid
    expect(paper3).to_not be_valid
    expect(paper4).to_not be_valid
  end
end
