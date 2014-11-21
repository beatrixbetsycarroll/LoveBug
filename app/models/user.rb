class User < ActiveRecord::Base
  # Remember to create a migration!
  has_secure_password

  has_many :user_stds
  has_many :stds, through: :user_stds

  has_many :messages, :foreign_key => 'receiver_id'
  has_many :messages, :foreign_key => 'sender_id'

  has_many :trust_relationships, :foreign_key => 'user_a'
  has_many :trust_relationships, :foreign_key => 'user_b'

end


# class User < ActiveRecord::Base
#   has_many :sent_private_messages, :class_name => 'PrivateMessage', :foreign_key => 'sender_id'
#   has_many :received_private_messages, :class_name => 'PrivateMessage', :foreign_key => 'recipient_id'
# end
