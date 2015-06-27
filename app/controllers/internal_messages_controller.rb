class InternalMessagesController < ApplicationController
  before_action :set_internal_message, only: [:show, :edit, :update, :destroy]

  # GET /internal_messages
  # GET /internal_messages.json
  def index
    @internal_messages = InternalMessage.all
  end

  # GET /internal_messages/1
  # GET /internal_messages/1.json
  def show
    @internal_messages = InternalMessage.all().order(created_at: :asc)
  end

  # GET /internal_messages/new
  def new
    @internal_message = InternalMessage.new
  end

  # GET /internal_messages/1/edit
  def edit
  end

  # POST /internal_messages
  # POST /internal_messages.json
  def create
    @internal_message = InternalMessage.new(internal_message_params)

    respond_to do |format|
      if @internal_message.save
        format.html { redirect_to @internal_message, notice: 'Internal message was successfully created.' }
        format.json { render :show, status: :created, location: @internal_message }
      else
        format.html { render :new }
        format.json { render json: @internal_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /internal_messages/1
  # PATCH/PUT /internal_messages/1.json
  def update
    respond_to do |format|
      if @internal_message.update(internal_message_params)
        format.html { redirect_to @internal_message, notice: 'Internal message was successfully updated.' }
        format.json { render :show, status: :ok, location: @internal_message }
      else
        format.html { render :edit }
        format.json { render json: @internal_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /internal_messages/1
  # DELETE /internal_messages/1.json
  def destroy
    @internal_message.destroy
    respond_to do |format|
      format.html { redirect_to internal_messages_url, notice: 'Internal message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_internal_message
      @internal_message = InternalMessage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def internal_message_params
      params[:internal_message].permit(:message, :author)
    end
end
