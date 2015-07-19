require 'rails_helper'

RSpec.describe SpeciesPicsController, :type => :controller do

  describe 'Get #index' do
    before :each do
      @species = create(:species)
    end
    it 'renders the :index template' do
      get :index, id: @species
      expect(response).to render_template :index
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves the pic in the database' do
        expect{
          post :create, species_pic: attributes_for(:species_pic)
        }.to change(SpeciesPic, :count).by(1)
      end
      it 'doesn\'t redirect to species_pic#index' do
        post :create, species_pic: attributes_for(:species_pic)
        expect(response).not_to render_template :index
      end
      it 'responds with success status' do
        post :create, species_pic: attributes_for(:species_pic)
        expect(response.body).to have_content "success"
      end
    end
    context 'with invalid attributes' do
      it 'does not save the new species pic to the database' do
        expect{
          post :create,
          species_pic: attributes_for(:invalid_species_pic)
        }.not_to change(SpeciesPic, :count)
      end
      it 're-renders the :new template' do
        post :create,
          species_pic: attributes_for(:invalid_species_pic)
        expect(response.body).to have_content 'Avatar can\'t be blank'
      end
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @species_pic = create(:species_pic)
      @species = create(:species)
    end
    it 'deletes the species pic' do
      expect{
        delete :destroy, id: @species_pic, species_id: @species
      }.to change(SpeciesPic, :count).by(-1)
    end
    it 'redirects to species_pics#index' do
      delete :destroy, id: @species_pic, species_id: @species
      expect(response).to redirect_to "/species_pics/index/#{@species.id}"
    end
  end
end
