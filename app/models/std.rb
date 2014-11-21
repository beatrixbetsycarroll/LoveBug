class Std < ActiveRecord::Base
  # Remember to create a migration!
  has_many :user_stds
  has_many :users, through: :user_stds
end
