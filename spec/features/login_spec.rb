require 'rails_helper'

describe "User Login" do 
  describe 'happy path' do 
    it 'allows user to succesfully login' do 
      user1 = User.create!(name: "Joe User", email: "joeuser@gmail.com", password: "pass123")
      visit root_path 

      fill_in :email, with: user1.email 
      fill_in :password, with: user1.password 
      click_button "Login"

      expect(current_path).to eq(dashboard_path(user1.id))
      expect(page).to have_content("Welcome to your Dashboard, #{user1.name}")
      expect(page).to have_content("Logout")
      expect(page).to_not have_content("Login")

    end
    describe "sad path" do 
      it "blocks login if credentials are bad" do 
        user1 = User.create!(name: "Joe User", email: "joeuser@gmail.com", password: "pass123")
        
        visit root_path 
        
        fill_in :email, with: user1.email 
        fill_in :password, with: "wrongpassword"
        click_button "Login"

        expect(page).to have_content("Invalid Credentials, please try again")
        expect(current_path).to eq(root_path)
        
      end
    end
    describe 'logged in user can logout' do 
      it "allows current user to to log out" do
        user1 = User.create!(name: "Joe User", email: "joeuser@gmail.com", password: "pass123")

        visit root_path
        fill_in :email, with: user1.email 
        fill_in :password, with: user1.password
        click_button "Login"

        click_link 'Logout'

        expect(current_path).to eq(root_path)
      end 
    end 
  end
end
