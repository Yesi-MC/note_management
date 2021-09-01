class Note < ApplicationRecord
  belongs_to :user

  validates_presence_of :title, 
                        :body, 
                        :created_at
end
