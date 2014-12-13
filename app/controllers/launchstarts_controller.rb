class LaunchstartsController < ApplicationController
  before_action :set_launchstart, only: [:show, :edit, :update, :destroy]

  # GET /launchstarts
  # GET /launchstarts.json
  def index
    @launchstarts = Launchstart.all
  end

  # GET /launchstarts/1
  # GET /launchstarts/1.json
  def show
  end

  # GET /launchstarts/new
  def new
    @launchstart = Launchstart.new
  end

  # GET /launchstarts/1/edit
  def edit
  end

  # POST /launchstarts
  # POST /launchstarts.json
  def create
    @launchstart = Launchstart.new(launchstart_params)

    respond_to do |format|
      if @launchstart.save
        format.html { redirect_to @launchstart, notice: 'Launchstart was successfully created.' }
        format.json { render :show, status: :created, location: @launchstart }
      else
        format.html { render :new }
        format.json { render json: @launchstart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /launchstarts/1
  # PATCH/PUT /launchstarts/1.json
  def update
    respond_to do |format|
      if @launchstart.update(launchstart_params)
        format.html { redirect_to @launchstart, notice: 'Launchstart was successfully updated.' }
        format.json { render :show, status: :ok, location: @launchstart }
      else
        format.html { render :edit }
        format.json { render json: @launchstart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /launchstarts/1
  # DELETE /launchstarts/1.json
  def destroy
    @launchstart.destroy
    respond_to do |format|
      format.html { redirect_to launchstarts_url, notice: 'Launchstart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_launchstart
      @launchstart = Launchstart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def launchstart_params
      params[:launchstart]
    end
end
