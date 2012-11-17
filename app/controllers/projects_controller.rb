class ProjectsController < ApplicationController
	respond_to :json, :js, :html
  before_filter :authenticate_user!, :except => :trial

  def create
  	@project = Project.new
  	@project.set_name_from_params_or_default(params[:project])

    respond_to do |format|
      if @project.save
        render :show
      else
        format.json { render json: @project.errors, status: :unprocessable_entity }
        format.all { render :show }
      end
    end
  end

  def show
    render
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
    @project = Project.new.tap do |p|
      p.set_name_from_params_or_default({})
      p.trial = true
      p.save!
    end

    render :show
  end
end
