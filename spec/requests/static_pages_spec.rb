require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Contact Manager'" do
      visit '/static_pages/home'
      expect(page).to have_content('Contact Manager')
    end
  end
end
