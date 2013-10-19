class LinkClicksController < ApplicationController
  before_action :set_link_click, only: [:show, :edit, :update, :destroy]

  # GET /link_clicks
  # GET /link_clicks.json
  def index
    @link_clicks = LinkClick.all
  end

  # GET /link_clicks/1
  # GET /link_clicks/1.json
  def show
  end

  # GET /link_clicks/new
  def new
    @link_click = LinkClick.new
  end

  # GET /link_clicks/1/edit
  def edit
  end

  # POST /link_clicks
  # POST /link_clicks.json
  def create
    @link_click = LinkClick.new(link_click_params)

    respond_to do |format|
      if @link_click.save
        format.html { redirect_to @link_click, notice: 'Link click was successfully created.' }
        format.json { render action: 'show', status: :created, location: @link_click }
      else
        format.html { render action: 'new' }
        format.json { render json: @link_click.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /link_clicks/1
  # PATCH/PUT /link_clicks/1.json
  def update
    respond_to do |format|
      if @link_click.update(link_click_params)
        format.html { redirect_to @link_click, notice: 'Link click was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @link_click.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /link_clicks/1
  # DELETE /link_clicks/1.json
  def destroy
    @link_click.destroy
    respond_to do |format|
      format.html { redirect_to link_clicks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link_click
      @link_click = LinkClick.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_click_params
      params.require(:link_click).permit(:app_link_id, :ip_adress, :occurence_counter, :installed)
    end
end
