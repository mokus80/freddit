# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
	#validates :name, presence: true
	#validates :email, presence: true
	#validates :password, presence: true, length: { minimum: 6} 
	#validates :password_confirmation, presence: true
	has_many :ideas
	acts_as_voter
end
