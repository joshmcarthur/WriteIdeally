class HelpController < ApplicationController

  before_filter :authenticate_admin_user!, :except => [:index, :show]
  layout 'help'

  #Publically accessible
  def index
    @fragments = HelpFragment.all
  end

  def show
    @fragment = HelpFragment.find_by_stub(params[:stub])
  end

  #Administrators only
  def edit
    @fragment = HelpFragment.find_by_id(params[:id])
  end

  def update
    @fragment = HelpFragment.find_by_id(params[:id])
    if @fragment.update_attributes(params[:help_fragment])
      flash[:notice] = "A help fragment for #{@fragment.stub} was successfully updated."
      redirect_to help_index_url
    else
      flash[:error] = "Error updating fragment, please try again later."
      redirect_to edit_help_path(@fragment)
    end
  end

  def new
    @fragment = HelpFragment.new
  end

  def create
    @fragment = HelpFragment.new(params[:help_fragment])
    if @fragment.save
      flash[:notice] = "A help fragment for #{@fragment.stub} was successfully created."
      redirect_to help_index_url
    else
      flash[:error] = "Error creating fragment, please try again."
      render :action => 'new'
    end
  end

  def destroy
    @fragment = HelpFragment.find_by_id(params[:id])
    if @fragment.destroy
      flash[:notice] = "A help fragment for #{@fragment.stub} was successfully removed."
    else
      flash[:error] = "Error removing fragment, please try again later."
    end
    redirect_to help_index_url
  end
end

