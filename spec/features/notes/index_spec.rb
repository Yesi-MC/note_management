require 'rails_helper'

RSpec.describe "As a logged in user" do 
  describe "When I visit 'users/:id/dashboard" do 
    before :each do 
      @user1 = User.create!(name: "Michael Scott", email: "michaels@gmail.com", password: "pass123!!")
      @note1 = Note.create!(title: "Todays Meeting Notes", body: "these are my notes for today", created_at: "Friday 12:00", user_id: @user1.id)
      @note2 = Note.create!(title: "More Notes", body: "these are more notes I took", created_at: "Monday 1:00", user_id: @user1.id)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
    end 
    it "allows the user to see/read all their notes" do 

      visit dashboard_path(@user1.id)

      expect(current_path).to eq(dashboard_path(@user1.id))
      expect(page).to have_content("All My Notes")

      within "#note-#{@note1.id}" do 
        expect(page).to have_content(@note1.title)
        expect(page).to have_content(@note1.created_at)
        expect(page).to have_content(@note1.user.name)
        expect(page).to have_content(@note1.body)
      end
      within "#note-#{@note2.id}" do 
        expect(page).to have_content(@note2.title)
        expect(page).to have_content(@note2.created_at)
        expect(page).to have_content(@note2.user.name)
        expect(page).to have_content(@note2.body)
      end
    end
  end
end