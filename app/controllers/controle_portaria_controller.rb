class ControlePortariaController < ApplicationController
  before_action :authenticate_user!
  before_action :set_controle_portarium, only: [:show, :edit, :update, :destroy]

  # GET /controle_portaria
  # GET /controle_portaria.json
  def index
    @controle_portaria = ControlePortarium.all
  end

  # GET /controle_portaria/1
  # GET /controle_portaria/1.json
  def show
  end

  # GET /controle_portaria/new
  def new
    @controle_portarium = ControlePortarium.new
  end

  # GET /controle_portaria/1/edit
  def edit
  end

  # POST /controle_portaria
  # POST /controle_portaria.json
  def create
    @controle_portarium = ControlePortarium.new(controle_portarium_params)

    respond_to do |format|
      if @controle_portarium.save
        format.html { redirect_to @controle_portarium, notice: 'Controle portarium was successfully created.' }
        format.json { render :show, status: :created, location: @controle_portarium }
      else
        format.html { render :new }
        format.json { render json: @controle_portarium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /controle_portaria/1
  # PATCH/PUT /controle_portaria/1.json
  def update
    respond_to do |format|
      if @controle_portarium.update(controle_portarium_params)
        format.html { redirect_to @controle_portarium, notice: 'Controle portarium was successfully updated.' }
        format.json { render :show, status: :ok, location: @controle_portarium }
      else
        format.html { render :edit }
        format.json { render json: @controle_portarium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /controle_portaria/1
  # DELETE /controle_portaria/1.json
  def destroy
    @controle_portarium.destroy
    respond_to do |format|
      format.html { redirect_to controle_portaria_url, notice: 'Controle portarium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_controle_portarium
      @controle_portarium = ControlePortarium.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def controle_portarium_params
      params.require(:controle_portarium).permit(:nome, :documento, :empresa, :placa, :entrada, :saida, :obs)
    end
end
