class ProjectsController < ApplicationController
  def list
    @projects = Projects.find(:all)
   end
   def show
     @projects = Projects.find(params[:id])
   end
   def new
   end
   def create
   end
   def edit
   end
   def update
   end
   def delete
   end
end
