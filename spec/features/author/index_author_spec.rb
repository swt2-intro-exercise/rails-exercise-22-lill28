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