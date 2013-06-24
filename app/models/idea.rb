class Idea < ActiveRecord::Base
	# attr_accessible :content, :name, :title
	acts_as_voteable
end
