require 'rails_helper'

RSpec.describe SpeciesController, :type => :controller do

  describe 'Get #index' do
    context 'with params[:location] an empty string and params[:radius] an empty string' do
      it 'populates an array of all species' do
        rabbit = create(:species, name: 'rabbit')
        bearded_dragon = create(:species, id: 2, name: 'bearded dragon')
        get :index
        expect(assigns(@species)).to match_array([rabbit, bearded_dragon])
      end
    end
    context 'with params[:location] set and params[:radius] empty' do
      it 'assigns the requested location to @location' do
        get :index, locations: 'San Diego', radius: ''
        expect(assigns(:locations)).to eq locations
      end
      it 'populates an array of locations near the location' do
        @species = create(:species)
        @sighting = create(:sighting, location: 'San Diego', species_id: @species.id)
        get :index, location: 'San Diego', radius: ''
        expect(assigns(:locations)).to match_array(['San Diego'])
      end
    end
    context 'with params[:location] set and params[:radius] set' do
      it 'populates an array of locations near and within a radius' do
        @species = create(:species)
        @near_sighting = create(:sighting, location: 'San Diego', species_id: @species.id)
        @far_sighting = create(:sighting, location: 'New York', species_id: @species.id)
       get :index, location: 'San Diego', radius: '50'
       expect(assigns(@locations)).to match_array(['San Diego'])
      end
    end
    context 'with params[:location] nil and params[:radius] nil' do
      it 'populates an array of all species' do
        rabbit = create(:species, name: 'rabbit')
        bearded_dragon = create(:species, id: 2, name: 'bearded dragon')
        get :index
        expect(assigns(@species)).to match_array([rabbit.name, bearded_dragon.name])
      end
    end
  end

  describe 'GET #show' do
    it 'renders the show template' do
      species = create(:species)
      get :show, id: species
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it 'renders the :edit template' do
      species = create(:species)
      get :edit, id: species
      expect(response).to render_template :edit
    end
  end

  describe 'PATCH #update' do
    before :each do
      @species = create(:species)
    end

    context 'with valid attributes' do
      it 'locates the requested @species' do
        patch :update, id: @species, species: attributes_for(:species)
        expect(assigns(:species)).to eq(@species)
      end
      it 'changes @species\'s attributes' do
        patch :update, id: @species,
          species: attributes_for(:species,
                                 name: 'Salamander')
        @species.reload
        expect(@species.name).to eq('Salamander')
      end
      it 'redirects to species' do
        patch :update, id: @species, species: attributes_for(:species)
        expect(response).to redirect_to @species
      end
    end

    context 'with invalid attributes' do
      it 'does not change the species attributes' do
        patch :update, id: @species, species: attributes_for(:species,
                                                            name: nil)
        expect(@species.name).not_to eq(nil)
      end
      it 're-renders the :edit template' do
        patch :update, id: @species,
          species: attributes_for(:invalid_species)
        expect(response).to render_template :edit
      end
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves the new species in the database' do
        expect{
          post :create, species: attributes_for(:species)
        }.to change(Species, :count).by(1)
      end
    end
    
    context 'with invalid attributes' do
      it 'does not save the new species to the database' do
        expect{
        post :create, species: attributes_for(:species, name: nil)
        }.not_to change(Species, :count)
      end
      it 're-renders the :new template' do
        post :create,
          species: attributes_for(:invalid_species)
        expect(response).to render_template :new
      end
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @species = create(:species)
    end
    it 'deletes the species' do
      expect{
        delete :destroy, id: @species
      }.to change(Species, :count).by(-1)
    end
    it 'redirects to species#index' do
      delete :destroy, id: @species
      expect(response).to redirect_to '/species'
    end
  end
end
