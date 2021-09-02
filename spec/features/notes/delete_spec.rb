require 'rails_helper'

RSpec.describe "As a logged in user I can delete my notes" do 
  describe "When I visit '/users/:id/note/:id' page" do 
    before :each do 
      @user1 = User.create!(name: "Michael Scott", email: "michaels@gmail.com", password: "pass123!!")
      @note1 = Note.create!(title: "Todays Meeting Notes", body: "these are my notes for today", created_at: "Friday 12:00", user_id: @user1.id)
      @note2 = Note.create!(title: "More Notes", body: "these are more notes I took", created_at: "Monday 1:00", user_id: @user1.id)
      @note3 = Note.create!(title: "My other note", body: "these are other notes", created_at: "Thursdat 1:00", user_id: @user1.id)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
    end
    it " can delete a note from the note show page" do 
      visit "users/#{@user1.id}/note/#{@note3.id}"

      expect(page).to have_button("Delete Note")
      click_button "Delete Note"

      expect(current_path).to eq(dashboard_path(@user1.id))

      expect(page).to_not have_content(@note3.title)
    end
  end 
end 