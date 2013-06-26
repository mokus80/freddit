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
	#validates :password, presence: true, length: { minimum: 6} 
	#validates :password_confirmation, presence: true
	# attr_accessible :name, :email
	validates :name,  presence: true, length: { maximum: 50 }
  	VALID_EMAIL_REGEX = /@/
  	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

	has_many :ideas
	acts_as_voter
end
