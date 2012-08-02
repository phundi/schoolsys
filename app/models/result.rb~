class Result < ActiveRecord::Base

belongs_to :Student
validates_presence_of :english, :mathematics, :student_id, :physical_science, :chichewa, :computer_studies, :biology
validates_numericality_of :english, :mathematics, :student_id, :physical_science, :chichewa, :computer_studies, :biology, :only_integer => true, :message => "can only be whole number."
validates_inclusion_of :english, :mathematics, :student_id, :physical_science, :chichewa, :computer_studies, :biology, :in => 0..100, :message => "can only be between 0 and 100." 

 def sum
   (english + mathematics + physical_science + chichewa + computer_studies + biology)/6
 end

 def mode

 end
def std_deviation
  
end
def median
  
end
end
