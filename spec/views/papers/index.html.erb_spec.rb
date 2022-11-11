require 'rails_helper'

RSpec.describe "papers/index", type: :view do
  before(:each) do
    assign(:papers, [
      Paper.create!(
        title: "Title",
        venue: "Venue",
        year: 2
      ),
      Paper.create!(
        title: "Title",
        venue: "Venue",
        year: 2
      )
    ])
  end

  puts :papers

  it "renders a list of papers" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Title".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Venue".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
  end
end

describe "render index author page", type: :feature do

  it "renders an edit link for each paper" do
    paper1 = Paper.create(title:"flup", venue:"huiii", year:2)
    paper2 = Paper.create(title:"flup", venue:"huiii", year:2)

    visit papers_path
    expect(page).to  have_link 'Edit Paper', href: edit_paper_path(paper1.id)
    expect(page).to  have_link 'Edit Paper', href: edit_paper_path(paper2.id)
  end
end