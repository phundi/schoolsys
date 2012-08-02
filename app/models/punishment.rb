class Punishment < ActiveRecord::Base
belongs_to :Students
validates_presence_of :status
validates_uniqueness_of :id
 
 def archive
  disable_punishment
 end
 def disable_punishment
  self.status = "active"
 end
 def self.search(search)
   search_condition = '%' + search +'%'
   find(:all, :conditions =>['description LIKE ? OR status LIKE ?' , search_condition, search_condition]) 
 end
 end

