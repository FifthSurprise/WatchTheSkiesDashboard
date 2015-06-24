class PublicRelationsController < ApplicationController
  before_action :set_public_relation, only: [:show, :edit, :update, :destroy]

  # GET /public_relations
  # GET /public_relations.json
  def index
    @public_relations = PublicRelation.all.order(round: :asc, created_at: :asc)
    @countries = countries.collect{|x|x[0]}
  end

  # GET /public_relations/1
  # GET /public_relations/1.json
  def show
  end

  # GET /public_relations/new
  def new
    @public_relation = PublicRelation.new
    @current_round = Game.first.current_round
    @countries = countries
  end

  # GET /public_relations/1/edit
  def edit
    @current_round = @public_relation.round
    @countries = countries
  end

  # POST /public_relations
  # POST /public_relations.json
  def create
    @public_relation = PublicRelation.new(public_relation_params)

    respond_to do |format|
      if @public_relation.save
        format.html { redirect_to @public_relation, notice: 'Public relation was successfully created.' }
        format.json { render :show, status: :created, location: @public_relation }
      else
        format.html { render :new }
        format.json { render json: @public_relation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /public_relations/1
  # PATCH/PUT /public_relations/1.json
  def update
    respond_to do |format|
      if @public_relation.update(public_relation_params)
        format.html { redirect_to @public_relation, notice: 'Public relation was successfully updated.' }
        format.json { render :show, status: :ok, location: @public_relation }
      else
        format.html { render :edit }
        format.json { render json: @public_relation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /public_relations/1
  # DELETE /public_relations/1.json
  def destroy
    @public_relation.destroy
    respond_to do |format|
      format.html { redirect_to public_relations_url, notice: 'Public relation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def country_status
    @country = params[:country]
    @countries = countries.collect{|x|x[0]}
    if countries.any?{|x| x[0]==@country}
      @public_relations = PublicRelation.order(round: :asc, created_at: :asc).where country: @country
      @pr_amounts = PublicRelation.where(country: @country).group(:round).sum("pr_amount").sort_by{|round, pr_amount| round}
    else
      raise ActionController::RoutingError.new('Country Not Found')
    end    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_public_relation
      @public_relation = PublicRelation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def public_relation_params
      params[:public_relation].permit(:country, :description, :round, :pr_amount)
    end

    def countries
      return [['Brazil','Brazil'],['China','China'],['France','France'], ['India','India'],
      ['Japan','Japan'], ['Russian Federation','Russian Federation'],
      ['United Kingdom','United Kingdom'],['USA' ,'USA'],['Germany','Germany']]
    end
end
