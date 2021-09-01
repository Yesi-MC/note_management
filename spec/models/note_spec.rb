require 'rails_helper'

RSpec.describe Note, type: :model do
  describe 'relationships' do 
    it {should belong_to :user}
  end

  describe 'validations' do 
    it {should validate_presence_of :title}
    it {should validate_presence_of :body}
    it {should validate_presence_of :created_at}
  end
end
