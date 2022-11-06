require 'rails_helper'

RSpec.describe Author, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  it "should save an instance of the author model" do
    author = Author.new(first_name:"Bilbo", last_name:"Baggins", homepage:"bilbo.baggins@theshire.com")
    expect(author.first_name).to eq("Bilbo")
    expect(author.last_name).to eq("Baggins")
    expect(author.homepage).to eq("bilbo.baggins@theshire.com")
  end
  it "should have a name method returning first and last name" do
    author = Author.new(first_name:"Bilbo", last_name:"Baggins", homepage:"bilbo.baggins@theshire.com")
    expect(author.name).to eq("Bilbo Baggins")
  end
  it "should be invalid whe last name is an empty string" do
    author = Author.new(first_name:"Bilbo", last_name:"", homepage:"bilbo.baggins@theshire.com")
    expect(author).to_not be_valid
  end
end
