class Assignment < ActiveRecord::Base

	belongs_to :issue
	belongs_to :user
	validates_presence_of :issue_id, :user_id 

end