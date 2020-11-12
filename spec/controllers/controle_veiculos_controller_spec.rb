require 'rails_helper'

RSpec.describe ControleVeiculosController, type: :controller do

  context 'GET #new' do
    before :each do
      user = User.create(email: 'test@test.com', password: "password", password_confirmation: "password")
      sign_in user
    end

    it 'should success render new' do
      get :new
      expect(response).to have_http_status(200)
      expect(assigns(:controle_veiculo)).to be_a(ControleVeiculo)
    end
  end

  context 'POST #create' do

    before :each do
      user = User.create(email: 'test@test.com', password: "password", password_confirmation: "password")
      sign_in user
    end

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
    before :each do
      user = User.create(email: 'test@test.com', password: "password", password_confirmation: "password")
      sign_in user
    end
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
end
