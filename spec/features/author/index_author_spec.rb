require 'rails_helper'

describe "render index author page", type: :feature do
    it "should exist at 'author_path' and render withour error" do
        # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
        visit authors_url
    end
end