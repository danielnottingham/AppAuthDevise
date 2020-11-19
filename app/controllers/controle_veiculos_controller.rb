class ControleVeiculosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_controle_veiculo, only: [:show, :edit, :update, :destroy]

  # GET /controle_veiculos
  # GET /controle_veiculos.json
  def index
    @controle_veiculos = ControleVeiculo.all
  end

  # GET /controle_veiculos/1
  # GET /controle_veiculos/1.json
  def show
  end

  # GET /controle_veiculos/new
  def new
    @controle_veiculo = ControleVeiculo.new
  end

  # GET /controle_veiculos/1/edit
  def edit
  end

  # POST /controle_veiculos
  # POST /controle_veiculos.json
  def create
    binding.pry
    @controle_veiculo = ControleVeiculo.new(controle_veiculo_params)

    respond_to do |format|
      if @controle_veiculo.save
        format.html { redirect_to @controle_veiculo, notice: 'Controle veiculo was successfully created.' }
        format.json { render :show, status: :created, location: @controle_veiculo }
      else
        format.html { render :new }
        format.json { render json: @controle_veiculo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /controle_veiculos/1
  # PATCH/PUT /controle_veiculos/1.json
  def update
    respond_to do |format|
      if @controle_veiculo.update(controle_veiculo_params)
        format.html { redirect_to @controle_veiculo, notice: 'Controle veiculo was successfully updated.' }
        format.json { render :show, status: :ok, location: @controle_veiculo }
      else
        format.html { render :edit }
        format.json { render json: @controle_veiculo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /controle_veiculos/1
  # DELETE /controle_veiculos/1.json
  def destroy
    @controle_veiculo.destroy
    respond_to do |format|
      format.html { redirect_to controle_veiculos_url, notice: 'Controle veiculo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_controle_veiculo
      @controle_veiculo = ControleVeiculo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def controle_veiculo_params
      params.require(:controle_veiculo).permit(:motorista, :placa, :entrada, :saida, :obs)
    end
end
