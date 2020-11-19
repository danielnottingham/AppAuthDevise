require 'rails_helper'

RSpec.describe ControleVeiculosController, type: :controller do

  before :each do
    user = User.create(email: 'test@test.com', password: "password", password_confirmation: "password")
    sign_in user
  end

  context 'GET #new' do

    it 'should success render new' do
      get :new
      expect(response).to have_http_status(200)
      expect(assigns(:controle_veiculo)).to be_a(ControleVeiculo)
    end
  end

  context 'POST #create' do

    veiculo_attributes = FactoryBot.attributes_for(:controle_veiculo)
    let!(:params) do
      {
        'controle_veiculo' => veiculo_attributes
      }
    end

    it 'create a new controle_veiculo' do
      expect { post :create, params: params }.to change(ControleVeiculo, :count).from(0).to(1)
    end
  end

  context 'GET #index' do

    it 'should success and render to index page' do
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end

    it 'should have a array empty' do
      get :index
      expect(assigns(:controle_veiculos)).to be_empty
    end

    it 'should have at least one controle_veiculo' do
      create(:controle_veiculo)
      get :index
      expect(assigns(:controle_veiculos)).to_not be_empty
    end
  end

  context 'DELETE #destroy' do

    let!(:controle_veiculo) { create(:controle_veiculo) }

    it 'should delete controle_veiculo' do
      expect { delete :destroy, params: { id: controle_veiculo.id } }.to change(ControleVeiculo, :count).from(1).to(0)
      expect(response).to redirect_to(action: :index)
    end
  end

  context 'PUT #update' do

    let!(:controle_veiculo) { create(:controle_veiculo) }
    let!(:params) do
      {
        'controle_veiculo' => { motorista: 'Edimo', placa: 'PTX-6678' },
        'id' => controle_veiculo.id
      }
    end

    it 'should update controle_veiculo info' do
      put :update, params: params
      controle_veiculo.reload
      expect(controle_veiculo.motorista).to eq('Edimo')
    end

  end
end
