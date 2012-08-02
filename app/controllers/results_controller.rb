class ResultsController < ApplicationController
layout "forms"  
before_filter :authorize
  def index
    @results = Result.all

    respond_to do |format|
      format.html 
      format.xml  { render :xml => @results }
    end
  end

  
  def show
    @result = Result.find(params[:id])

    respond_to do |format|
      format.html 
      format.xml  { render :xml => @result }
    end
  end

 
  def new
    @result = Result.new

    respond_to do |format|
      format.html 
      format.xml  { render :xml => @result }
    end
  end

  def edit
    @result = Result.find(params[:id])
  end

  def create
    @result = Result.new(params[:result])

    respond_to do |format|
      if @result.save
        flash[:notice] = 'Result was successfully created.'
        format.html { redirect_to(@result) }
        format.xml  { render :xml => @result, :status => :created, :location => @result }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @result.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @result = Result.find(params[:id])

    respond_to do |format|
      if @result.update_attributes(params[:result])
        flash[:notice] = 'Result was successfully updated.'
        format.html { redirect_to(@result) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @result.errors, :status => :unprocessable_entity }
      end
    end
  end

 def destroy
    @result = Result.find(params[:id])
    @result.destroy

    respond_to do |format|
      format.html { redirect_to(results_url) }
      format.xml  { head :ok }
    end
  end
def search(search)
  begin
	  search_condition = search.to_i  
	  find(:all, :condition['id == ? OR student_id == ?', search_condition, search_condition])
  rescue
  	  search_condition = '%' + search + '%'
          std_search = Student.find(:first, :condition['first_name LIKE ? OR surname LIKE ?', search_condition, search_condition])
	  find(:all, :condition['id == ?', std_search.first.id])
  end
end
end
