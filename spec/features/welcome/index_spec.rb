require 'rails_helper'

RSpec.describe "as a user" do 
  describe "when I visit '/'" do 
    it "should see a button to login user" do 
      visit root_path

      expect(page).to have_field("email")
      expect(page).to have_field("password")
      expect(page).to have_button("Login")
    end
    it "allows user to user to login to dashboard" do 
      user1 = User.create!(name: "Joe User", email: "joeuser@gmail.com", password: "pass123")

      visit root_path

      fill_in :email, with: user1.email 
      fill_in :password, with: user1.password 
      click_button "Login"

      expect(current_path).to eq(dashboard_path(user1.id)) 
    end
  end
end
