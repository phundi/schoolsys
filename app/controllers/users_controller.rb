class UsersController < ApplicationController
    layout "forms"

  def login
    @user = User.new
    @user.login_name = params[:username]
  end

  def process_login
    
    user = User.authenticate(params[:user])
    
    if !user.nil?
     session[:id] =user.id
     redirect_to :controller =>'forms', :action => 'index'
     
    else
     flash[:error] ='Invalid Login Details!'
     redirect_to :action => 'login', :login_name => params[:user][:login_name]
    end
  end
  def logout
   reset_session
   loggedin = false
   flash[:message] ='logged out'
   redirect_to :action =>'login'
  end

  def my_account

  end
 def create
  @user = User.new(params[:user])
  
    respond_to do |format|
      if @user.save
        flash[:msg] = 'User was successfully created.'
        format.html { redirect_to :action => 'login' }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        flash[:msg] = "Failed To Create User Account"
        format.html { render :action => 'signup' }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end

    end
 end

 def signup
   @user = User.new
    respond_to do |format|
    format.html
    format.xml { render :xml => @user}
      end
end

end
