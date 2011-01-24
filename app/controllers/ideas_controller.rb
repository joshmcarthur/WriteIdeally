class IdeasController < ApplicationController

  before_filter :authenticate_user!

  def index
    unless params[:filter]
      @ideas = Idea.mine(current_user).paginate :page => params[:page], :per_page => 10
    else
      @ideas = Idea.mine(current_user).tagged_with(params[:filter]).paginate :page => params[:page], :per_page => 10
    end
  end


  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(params[:idea])
    @idea.user = current_user

    if @idea.save
      flash[:notice] = t('ideas.created.success', :title => @idea.title)
      params[:edit_after_create] ? redirect_to(edit_idea_path(@idea)) : redirect_to(root_path)
    else
      flash[:alert] = t('ideas.created.failure')
      redirect_to root_path and return
    end
  end

  def edit
    @idea = Idea.mine(current_user).find(params[:id])
  end

  def update
    @idea = Idea.mine(current_user).find(params[:id])
    @idea.update_attributes(params[:idea]) ? (flash[:notice] = t('ideas.updated.success', :title => @idea.title)) : (flash[:alert] = t('ideas.updated.failure'))
    redirect_to root_path
  end

  def destroy
    @idea = Idea.mine(current_user).find(params[:id])
    @idea.destroy ? (flash[:notice] = t('ideas.deleted.success', :title => @idea.title)) : (flash[:alert] = t('ideas.deleted.failure', :title => @idea.title))
    respond_to do |wants|
      wants.html { redirect_to root_path }
      wants.js { render }
    end
  end

  def show
    @idea = Idea.mine(current_user).find(params[:id])
  end

  def print
    @idea = Idea.mine(current_user).find(params[:id])
    render :layout => "print"
  end


end

