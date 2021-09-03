require 'rails_helper'

RSpec.describe "As a logged in user I can see notes show page" do 
  describe "When I visit 'users/:id/note/show' " do 
    before :each do 
      @user1 = User.create!(name: "Michael Scott", email: "michaels@gmail.com", password: "pass123!!")
      @note1 = Note.create!(title: "Todays Meeting Notes", body: "these are my notes for today", created_at: "Friday 12:00", user_id: @user1.id)
      @note2 = Note.create!(title: "More Notes", body: "these are more notes I took", created_at: "Monday 1:00", user_id: @user1.id)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)
    end
    it "can see note and it's attributes" do
      visit "users/#{@user1.id}/note/#{@note1.id}"

      expect(page).to have_content(@note1.title)
      expect(page).to have_content(@note1.body)
      expect(page).to have_content(@note1.created_at.strftime("%A, %B %d, %Y"))
      expect(page).to have_content(@user1.name)
     end
  end 
end 