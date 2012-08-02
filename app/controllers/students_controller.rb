class StudentsController < ApplicationController
 layout "forms"
  before_filter :authorize
  def index
    @students = Student.all
    @results = Result.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @students }
    end
  end
 
  def show
	
    @url2 = ""
    @url_view = ""
    @student = Student.find(params[:id])
    grade = Result.find_by_student_id(@student.id)
     if grade
     data = [grade.mathematics, grade.english, grade.chichewa, grade.physical_science, grade.biology, grade.computer_studies]
     require 'rubygems'
     require 'gruff'
     require 'pdf/writer'
        g = Gruff::Line.new(400, 'blue')
        g.theme_37signals
        g.title = (@student.id.to_s + @student.first_name + " results graph")
        @url2 = (g.title + '.jpg').downcase
        @url_view = 'data//students//results//images//'+ @url2
        g.marker_count = 6
        range =(1..6)
        g.data("Scores Graph", data )
	g.labels = { 0 => 'Mat', 1 => 'Eng', 2 => 'Chic', 3 => 'Phy', 4 => 'Bio', 5 => 'IT'}
        g.write('public//images//' + @url_view)  
        
        doc = PDF::Writer.new
        doc.select_font'Times-Roman' 
        date = Time.now
        str = date.day.to_s + ' / '+ date.month.to_s + '/ ' + date.year.to_s + '     Time ' + date.min.to_s + ' : '+ date.sec.to_s 
        doc.text 'EXAMINATION RESULTS        generated on '+ str, :font_size => 15, :justification => 'center'
        doc.image 'public//images//' + @url_view, :justification => 'center'
        doc.save_as('public//images//data//students//results//pdf//' + g.title + '.pdf') 	       	
    end
    respond_to do |format|
      format.html
      format.xml  { render :xml => @student }
    end
  end

    def new
    @student = Student.new

    respond_to do |format|
      format.html 
      format.xml  { render :xml => @student }
    end
  end

   def edit
    @student = Student.find(params[:id])
  end
 
  def create
    @student = Student.new(params[:student])

    respond_to do |format|
      if @student.save
        flash[:notice] = 'Student was successfully created.'
        format.html { redirect_to(@student) }
        format.xml  { render :xml => @student, :status => :created, :location => @student }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @student.errors, :status => :unprocessable_entity }
      end
    end
  end

 
  def update
    @student = Student.find(params[:id])

    respond_to do |format|
      if @student.update_attributes(params[:student])
        flash[:notice] = 'Student was successfully updated.'
        format.html { redirect_to(@student) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @student.errors, :status => :unprocessable_entity }
      end
    end
  end

 
  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    respond_to do |format|
      format.html { redirect_to(students_url) }
      format.xml  { head :ok }
    end
  end
end
