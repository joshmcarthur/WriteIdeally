class ProjectsController < ApplicationController
	respond_to :json, :js, :html

  def create
  	@project = Project.new
  	@project.set_name_from_params_or_default(params[:project])

    respond_to do |format|
      if @project.save
        render
      else
        format.json { render json: @project.errors, status: :unprocessable_entity }
        format.all { render }
      end
    end
  end

  def update
  	@project = Project.find(params[:id])
    @project.name = params[:project][:name]
    @project.save

  	respond_with @project
  end

  def destroy
  end

  def trial
  end
end
