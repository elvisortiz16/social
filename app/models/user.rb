class User < ApplicationRecord
  has_secure_password

  has_one :profile

  accepts_nested_attributes_for :profile, update_only: true
end
