require 'rails_helper'

RSpec.describe SightingsController, :type => :controller do
  
  describe 'GET #new' do
    it 'assigns a new sighting to @sighting' do
      get :new
      expect(assigns(:species)).to be_a_new(Species)
    end
    it 'renders the :new template' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves the sighting to the database' do
        expect{
          post :create, 
          sighting: attributes_for(:sighting)
        }.to change(Sighting, :count).by(1)
      end
      it 'redirects to species#index' do
        post :create, sighting: attributes_for(:sighting)
        expect(response).to redirect_to '/species'
      end
    end
    context 'with invalid attributes' do
      it 'does not save to the database' do
        expect{
          post :create,
          sighting: attributes_for(:sighting)
        }.not_to change(Sighting, :count)
      end
      it 're-renders the new template' do
        post :create,
          sighting: attributes_for(:invalid_sighting)
        expect(response).to render_template :index
      end
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @sighting = create(:sighting)
    end
    it 'deletes the sighting' do
      expect{
        delete :destroy, id: @sighting
      }.to change(Sighting, :count).by(-1)
    end
    it 'redirects to species#index' do
      delete :destroy, id: @sighting
      expect(response).to redirect_to '/species'
    end
  end
end
