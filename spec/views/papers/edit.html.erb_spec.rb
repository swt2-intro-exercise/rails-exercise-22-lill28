require 'rails_helper'

RSpec.describe "papers/edit", type: :view do
  let(:paper) {
    Paper.create!(
      title: "MyString",
      venue: "MyString",
      year: 1
    )
  }

  before(:each) do
    assign(:paper, paper)
  end

  it "renders the edit paper form" do
    render

    assert_select "form[action=?][method=?]", paper_path(paper), "post" do

      assert_select "input[name=?]", "paper[title]"

      assert_select "input[name=?]", "paper[venue]"

      assert_select "input[name=?]", "paper[year]"
    end
  end
end

describe "contents", type: :feature do
  it "should have a multiple select" do
      paper = Paper.create(title:"Huiiiii", venue:"Hululu", year:1234)
      visit edit_paper_path(paper.id)
      expect(page.find(:select)[:multiple]).to be_truthy
  end
end