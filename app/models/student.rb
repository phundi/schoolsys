class Student < ActiveRecord::Base

has_many :results
belongs_to :form
has_one :punishment

validates_presence_of :first_name, :initial, :surname, :form_id, :date_of_birth
validates_numericality_of :form_id, :only_integer =>true , :message =>'Sorry! Only whole numbers allowed'
validates_inclusion_of :form_id, :in => 1..4, :message =>'Classes only within range 1 to 4'
#validates_uniqueness_of :image_url
validates_format_of :image_url,	
	:with => %r{\.(gif|jpg|jpeg|png)$}i,
	:message => 'must be a URL for GIF, JPG or PNG image.'

 def calculate_average_grade
     grade = Result.find_by_student_id(:id)
         return grade.sum
  end
end

