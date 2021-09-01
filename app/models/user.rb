class User < ApplicationRecord
  has_secure_password 

  has_many :notes 

  validates_presence_of :name, 
                        :email 

  validates_uniqueness_of :email 
end
