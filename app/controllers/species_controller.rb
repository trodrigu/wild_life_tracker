class SpeciesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    if params[:location] == '' && params[:radius] == ''
      @species = Species.all
    elsif params[:location] && params[:radius] == ''
      @locations = Sighting.near("#{params[:location]}")
      species = []
      @locations.each do |l|
        species << l.id
      end
      @species = Species.where(id: species)
    elsif params[:location] == '' && params[:radius]
      # implement users address relationship
      # for now render all
      @species = Species.all
    elsif params[:location] && params[:radius]
      @locations = Sighting.near("#{params[:location]}", params[:radius])
      species = []
      @locations.each do |l|
        species << l.id
      end
      @species = Species.where(id: species)
      params[:location].delete('1')
    else
      @species = Species.all
    end
  end

  def new
    @species = Species.new
  end

  def create
    @species = Species.new(species_params)
    if @species.save
       flash[:success] = "You added a species"
      redirect_to @species
    else
      render :new
    end
  end

  def show
    @species = Species.find(params[:id])
  end

  def edit
    @species = Species.find(params[:id])
  end

  def update
    @species = Species.find(params[:id])
    if @species.update_attributes(species_params)
      flash[:success] = "Done"
      redirect_to @species
    else
      render 'edit'
    end
  end

  def destroy
    @species = Species.find(params[:id])
    @species.destroy
    redirect_to '/species'
  end

  private
    def species_params
      params.require(:species).permit(:name, :id)
    end
end
