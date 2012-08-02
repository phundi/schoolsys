class FormsController < ApplicationController
before_filter:authorize
 
  def index
    @forms = Form.all    
    @users = User.all
    
  end

  
  def show
    @form = Form.find(params[:id])

   
  end

  
  def edit
    @form = Form.find(params[:id])
  end

   
  def update
    @form = Form.find(params[:id])

    respond_to do |format|
      if @form.update_attributes(params[:form])
        flash[:notice] = 'Form successfully updated.'
        format.html { redirect_to(@form) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @form.errors, :status => :unprocessable_entity }
      end
    end
  end 
end
