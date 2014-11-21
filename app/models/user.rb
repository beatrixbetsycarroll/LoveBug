class User < ActiveRecord::Base
  # Remember to create a migration!
  has_secure_password

  has_many :user_stds
  has_many :stds, through: :user_stds
end
