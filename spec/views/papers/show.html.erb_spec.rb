require 'rails_helper'

RSpec.describe "papers/show", type: :view do
  before(:each) do
    assign(:paper, Paper.create!(
      title: "Title",
      venue: "Venue",
      year: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Venue/)
    expect(rendered).to match(/2/)
  end
end

describe "render show paper page", type: :feature do
  it "should show the full author name" do
      author = Author.create(first_name:"Bilbo", last_name:"Baggins", homepage:"bilbo.baggins@theshire.com")
      paper = Paper.create(title:"hululu", venue: "huiiii", year:1234)
      paper.authors<<(author)
      visit edit_author_path(author.id)
      expect(page).to have_content("Bilbo Baggins")

  end
end
