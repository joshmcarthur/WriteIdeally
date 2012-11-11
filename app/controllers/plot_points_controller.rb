class PlotPointsController < ApplicationController
  respond_to :html, :js

  # GET /plot_points
  # GET /plot_points.json
  def index
    @plot_points = PlotPoint.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @plot_points }
    end
  end

  # GET /plot_points/1
  # GET /plot_points/1.json
  def show
    @plot_point = PlotPoint.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @plot_point }
    end
  end

  # POST /plot_points
  # POST /plot_points.json
  def create
    @plot_point = PlotPoint.new(params[:plot_point])
    @plot_point.title = I18n.t('plot_points.defaults.title') unless @plot_point.title.present?

    respond_to do |format|
      if @plot_point.save
        render
      else
        format.html { render action: "new" }
        format.json { render json: @plot_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /plot_points/1
  # PUT /plot_points/1.json
  def update
    @plot_point = PlotPoint.find(params[:id])

    respond_to do |format|
      if @plot_point.update_attributes(params[:plot_point])
        format.html { redirect_to @plot_point, notice: 'Plot point was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @plot_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plot_points/1
  # DELETE /plot_points/1.json
  def destroy
    @plot_point = PlotPoint.find(params[:id])
    @plot_point.destroy

    respond_to do |format|
      format.html { redirect_to plot_points_url }
      format.json { head :no_content }
    end
  end
end
