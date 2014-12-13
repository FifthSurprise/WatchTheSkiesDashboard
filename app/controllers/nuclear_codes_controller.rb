class NuclearCodesController < ApplicationController
  before_action :set_nuclear_code, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!

  def launched
    unless Game.first.nuclear_launch
      redirect_to root_path, method: :get
    end
    @launch = NuclearCode.where("target is not null").where("target is not ''")[0]
    if @launch.nil?
      g = Game.first
      g.nuclear_launch = false
      g.save
      redirect_to root_path, method: :get
    end
  end

  def enter_launch_codes
  end

  def verify_launch_codes
    codeA = params['codeA']
    codeB = params['codeB']
    target = params['target']
    entries = NuclearCode.where(codeA: codeA).where(codeB: codeB)
    unless entries.count==1 
    entries = NuclearCode.where(codeA: codeB).where(codeB: codeA)
    end

    if entries.count==1
      entry = entries[0]
      #launching missiles
      entry.target = target
      entry.save
      g = Game.first
      g.nuclear_launch = true
      g.save
      redirect_to root_path
    else
      redirect_to enter_codes_path, alert: 'Code invalid.'
    end
  end

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

    def foundCode? (code)
      NuclearCode.exists?(codeB: code) or NuclearCode.exists?(codeA: code)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nuclear_code_params
      params[:nuclear_code].permit(:country,:codeA,:codeB,:target,:country_flag)
    end
end
