class ApplicationController < ActionController::Base
  
$loggedin = 0
  helper :all 
  protect_from_forgery 
 
  def authorize
	@user = User.find(:first, :conditions => {:id => session[:id]})
	if !@user
                $loggedin = 1
		redirect_to:controller => "users", :action => "login"
		flash[:notice] = "Login first to continue"               
	
        else
	   
        end
  end 
end
