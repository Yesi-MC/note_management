require 'rails_helper'

RSpec.describe "as a user" do 
  describe "when I visit '/'" do 
    it "should see a button to login user" do 
      visit root_path

      expect(page).to have_field("email")
      expect(page).to have_field("password")
      expect(page).to have_button("Login")
    end
  end
end
