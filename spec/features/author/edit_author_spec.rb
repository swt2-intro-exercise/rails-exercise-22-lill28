require 'rails_helper'

describe "render edit author page", type: :feature do
    it "should exist at 'edit_author_path' and render withour error" do
        author = Author.create(first_name:"Bilbo", last_name:"Baggins", homepage:"bilbo.baggins@theshire.com")
        visit edit_author_path(author.id)
    end
end

describe "edit" do
    it "should edit data" do
        author = Author.create(first_name:"Frodo", last_name:"Baggins", homepage:"bilbo.baggins@theshire.com")
        visit edit_author_path(author.id)
        fill_in 'author[first_name]', with: 'Bilbo'
        fill_in 'author[last_name]', with: 'Baggins'
        fill_in 'author[homepage]', with: 'bilbo.baggins@theshire.com'
        click_button('submit')
        author.reload
        expect(author.first_name).to eq('Bilbo')
    end
end

