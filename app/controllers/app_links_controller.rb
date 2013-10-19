class AppLinksController < ApplicationController
  before_action :set_app_link, only: [:show, :edit, :update, :destroy]

  # GET /app_links
  # GET /app_links.json
  def index
    @app_links = AppLink.all
  end

  # GET /app_links/1
  # GET /app_links/1.json
  def show
  end

  # GET /app_links/new
  def new
    @app_link = AppLink.new
  end

  # GET /app_links/1/edit
  def edit
  end

  # POST /app_links
  # POST /app_links.json
  def create
    @app_link = AppLink.new(app_link_params)

    respond_to do |format|
      if @app_link.save
        format.html { redirect_to @app_link, notice: 'App link was successfully created.' }
        format.json { render action: 'show', status: :created, location: @app_link }
      else
        format.html { render action: 'new' }
        format.json { render json: @app_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /app_links/1
  # PATCH/PUT /app_links/1.json
  def update
    respond_to do |format|
      if @app_link.update(app_link_params)
        format.html { redirect_to @app_link, notice: 'App link was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @app_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /app_links/1
  # DELETE /app_links/1.json
  def destroy
    @app_link.destroy
    respond_to do |format|
      format.html { redirect_to app_links_url }
      format.json { head :no_content }
    end
  end

  def follow
    app = MobileApp.first
    redirect_to app.itunes_url

    app_link = AppLink.where(:referal => request.referrer, :mobile_app => app).first_or_create

    link_click = LinkClick.create(:app_link => app_link, :ip_adress => request.remote_ip)
    link_click.save

    # render text: "<a href=\"http://localhost:3000/app_links/follow\">Link</a>"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app_link
      @app_link = AppLink.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def app_link_params
      params.require(:app_link).permit(:mobile_app_id, :referal, :clicks_counter, :unique_visitor_counter)
    end
end
