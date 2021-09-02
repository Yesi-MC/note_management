require 'rails_helper'

RSpec.describe "As a logged in user" do 
  describe "When I visit 'users/:id/dashboard" do 
    before :each do 
      @user1 = User.create!(name: "Michael Scott", email: "michaels@gmail.com", password: "pass123!!")
      @note1 = Note.create!(title: "Todays Meeting Notes", body: "these are my notes for today", created_at: "Friday 12:00", user_id: @user1.id)
      @note2 = Note.create!(title: "More Notes", body: "these are more notes I took", created_at: "Monday 1:00", user_id: @user1.id)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
    end 
    it "allows a user to create a new note" do 
      visit new_user_note_path(@user1.id) 

      fill_in "Title", with: "Brand New Shiny Note" 
      fill_in "Body Text", with: "This is my brand new shiny note for today"
      click_button "Create Note" 

      expect(current_path).to eq(dashboard_path(@user1.id))
      
      expect(page).to have_content("Title: Brand New Shiny Note")
      expect(page).to have_content("Body Text: This is my brand new shiny note for today")
    end
  end 
end 