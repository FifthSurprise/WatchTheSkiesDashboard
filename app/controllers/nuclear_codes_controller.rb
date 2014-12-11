class NuclearCodesController < ApplicationController
  before_action :set_nuclear_code, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!
  
  # GET /nuclear_codes
  # GET /nuclear_codes.json
  def index
    @nuclear_codes = NuclearCode.all
  end

  # GET /nuclear_codes/1
  # GET /nuclear_codes/1.json
  def show
  end

  # GET /nuclear_codes/new
  def new
    @nuclear_code = NuclearCode.new
  end

  # GET /nuclear_codes/1/edit
  def edit
  end

  # POST /nuclear_codes
  # POST /nuclear_codes.json
  def create
    @nuclear_code = NuclearCode.new(nuclear_code_params)

    respond_to do |format|
      if @nuclear_code.save
        format.html { redirect_to @nuclear_code, notice: 'Nuclear code was successfully created.' }
        format.json { render :show, status: :created, location: @nuclear_code }
      else
        format.html { render :new }
        format.json { render json: @nuclear_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nuclear_codes/1
  # PATCH/PUT /nuclear_codes/1.json
  def update
    respond_to do |format|
      if @nuclear_code.update(nuclear_code_params)
        format.html { redirect_to @nuclear_code, notice: 'Nuclear code was successfully updated.' }
        format.json { render :show, status: :ok, location: @nuclear_code }
      else
        format.html { render :edit }
        format.json { render json: @nuclear_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nuclear_codes/1
  # DELETE /nuclear_codes/1.json
  def destroy
    @nuclear_code.destroy
    respond_to do |format|
      format.html { redirect_to nuclear_codes_url, notice: 'Nuclear code was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nuclear_code
      @nuclear_code = NuclearCode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nuclear_code_params
      params[:nuclear_code]
    end
end
