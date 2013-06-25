# == Schema Information
#
# Table name: ideas
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :string(255)
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Idea < ActiveRecord::Base
	# attr_accessible :content, :name, :title
	acts_as_voteable
	belongs_to :user
end
