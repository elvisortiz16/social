class User < ApplicationRecord
  has_secure_password

  has_one :profile
  has_many :user_friends
  has_many :posts

  accepts_nested_attributes_for :profile, update_only: true
  accepts_nested_attributes_for :posts
end
