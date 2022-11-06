require 'rails_helper'

describe "render index author page", type: :feature do
    it "should exist at 'author_path' and render withour error" do
        # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
        visit authors_path
    end
end

describe "contents author index page", type: :feature do
    it "should display a table" do
        visit authors_path
        expect(page).to have_table
    end
    it "should have a header with Name and Homepage" do
        visit authors_path
        expect(page).to have_selector 'table>tr>th', text: 'Name'
        expect(page).to have_selector 'table>tr>th', text: 'Homepage'
    end
    it "should have a link to create new authors" do 
        visit authors_path
        expect(page).to  have_link 'New author', href: new_author_path
    end
end

describe "delete", type: :feature do
    it "should delete" do
        author = Author.create(first_name:"Frodo", last_name:"Baggins", homepage:"bilbo.baggins@theshire.com")
        visit authors_path
        author_count = Author.count
        puts author_count
        click_link("Delete")
        expect(Author.count).to eq(author_count-1)
    end
end