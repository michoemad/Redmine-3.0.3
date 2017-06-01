class Note < ActiveRecord::Base
  #acts_as_attachable
 # attr_accessible :title
  # safe_attributes 'title'
  unloadable
    include Redmine::SafeAttributes
  attr_accessible :title,:link
  safe_attributes 'title','link'
  belongs_to :attachment
  
end
