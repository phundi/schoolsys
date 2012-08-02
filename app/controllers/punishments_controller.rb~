class PunishmentsController < ApplicationController
before_filter :authorize
layout "forms"

 def index
   
 @punishments = Punishment.all
 @punishments.each do |punishment|
   if punishment.due_date < Date.today
     punishment.status = 'cleared'
   else
     punishment.status = 'active'
   end
  punishment.save
  end
   respond_to do |format|
      format.html
      format.xml  { render :xml => @punishments }
    end
      
 end
def search
  @punishments = Punishment.search params[:search]
  @total = @punishments.length
  end
end
