class User < ApplicationRecord
    # Your user model attributes and logic here
   # has_many :room_messages
    validates :username, uniqueness: true, presence: true
  end