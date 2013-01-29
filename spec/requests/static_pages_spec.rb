require 'spec_helper'

describe "Static pages" do

  describe "Home Page" do

    it "should have the h1 'inclass'" do
    	visit '/static_pages/home'
    	page.should have_selector('h1', :text => 'inclass')
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      #get static_pages_index_path
      #response.status.should be(200)
    end
    it "should have the title 'Home'" do
    	visit '/static_pages/home'
    	page.should have_selector('title', :text => "Ruby on Rails Tutorial inclass app | Home")
    end
  end
  describe "Help page" do
	it "should have the h1'Help'" do
		visit '/static_pages/help'
		page.should have_selector('h1', :text => 'Help')
	end
	it "should have the title 'Help'" do
    	visit '/static_pages/help'
    	page.should have_selector('title', :text => "Ruby on Rails Tutorial inclass app | Help")
    end
   end
  describe "About page" do
	it "should have the h1 'About Us'" do
		visit '/static_pages/about'
		page.should have_selector('h1', :text => 'About Us')
	end
	it "should have the title 'About Us'" do
    	visit '/static_pages/about'
    	page.should have_selector('title', :text => "Ruby on Rails Tutorial inclass app | About Us")
    end
   end
end




