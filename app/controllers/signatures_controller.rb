class SignaturesController < ApplicationController
  before_filter :load_argument
  before_action :set_signature, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js

  def load_argument
    @argument = Argument.find(params[:argument_id])
  end

  # GET /signatures
  # GET /signatures.json
  def index
    @signatures = Signature.all
  end

  # GET /signatures/1
  # GET /signatures/1.json
  def show
  end

  # GET /signatures/new
  def new
    @signature = Signature.new
  end

  # GET /signatures/1/edit
  def edit
  end

  # POST /signatures
  # POST /signatures.json
  def create
    @signature = Signature.new({argument_id: @argument.id, signature: signature_params["signature"], negation: signature_params["negation"]})
    @signature.create_bitcoin_address_if_needed

    respond_to do |format|
      begin
        if @signature.save
          @argument.update_validity
          # redirect_to [@argument], notice: "Your vote of #{@signature.bitcoin_address.balance} is accepted"
          # format.html { redirect_to [@argument, @signature], notice: 'Signature was successfully created.' }
          flash[:notice] = "Your vote of #{@signature.bitcoin_address.balance/1e8} btc is accepted!"
          flash.keep(:notice)
          url = argument_url(@argument.id) + (@signature.negation ? "?doubt=1" : "")
          format.js   { render :create, :locals => {redirection_url: url, exception: nil} }
          # format.json { render :show, status: :created, location: @signature }
        else
          # format.html { render :new }
          error_message = @signature.errors.full_messages.join('; ')
          format.js   { render :create_fail, :locals => {error_message:  error_message, exception: nil} }
          # format.json { render json: @signature.errors, status: :unprocessable_entity }
        end
      rescue => e
       format.js {render :create_fail, :locals => {error_message: "Signature submission failed (non-unique signature?)" , exception: e}}
      end    

    end
  end

  # PATCH/PUT /signatures/1
  # PATCH/PUT /signatures/1.json
  def update
    respond_to do |format|
      if @signature.update(signature_params)
        format.html { redirect_to @signature, notice: 'Signature was successfully updated.' }
        format.json { render :show, status: :ok, location: @signature }
      else
        format.html { render :edit }
        format.json { render json: @signature.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /signatures/1
  # DELETE /signatures/1.json
  def destroy
    @signature.destroy
    respond_to do |format|
      format.html { redirect_to signatures_url, notice: 'Signature was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_signature
      @signature = Signature.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def signature_params
      params[:signature]
    end
end
