require 'rails_helper'

RSpec.describe "As a logged in user I can edit my notes" do 
  describe "When I visit '/users/:id/note/:id' note show page" do 
    before :each do 
      @user1 = User.create!(name: "Michael Scott", email: "michaels@gmail.com", password: "pass123!!")
      @note1 = Note.create!(title: "Todays Meeting Notes", body: "these are my notes for today", created_at: "Friday 12:00", user_id: @user1.id)
      @note2 = Note.create!(title: "More Notes", body: "these are more notes I took", created_at: "Monday 1:00", user_id: @user1.id)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
    end
     it "can see a button to edit my note" do
        visit "users/#{@user1.id}/note/#{@note1.id}"

        expect(page).to have_link("Edit Note")
        click_link "Edit Note"
        
        expect(current_path).to eq("/users/#{@user1.id}/note/#{@note1.id}/edit")
      end
      it "can update a note from the note show page" do 
        visit "users/#{@user1.id}/note/#{@note1.id}"

        click_link "Edit Note"
        expect(current_path).to eq("/users/#{@user1.id}/note/#{@note1.id}/edit")

        fill_in "Title", with: "Yesterday's meeting notes"
        click_button "Update Note"

        expect(page).to have_content("Title: Yesterday's meeting notes")
        expect(page).to have_content("Body Text: these are my notes for today")
      end
  end 
end 