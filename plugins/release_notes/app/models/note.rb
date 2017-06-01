class Note < ActiveRecord::Base
  #acts_as_attachable
 # attr_accessible :title
  # safe_attributes 'title'
  unloadable
    include Redmine::SafeAttributes
  attr_accessible :title,:link,:attachment,:attachment_id
  safe_attributes 'title','link',"attachment_id","attachment"
  belongs_to :attachment
  
end
