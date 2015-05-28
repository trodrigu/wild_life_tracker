class SpeciesController < ApplicationController
  def new
    @species = Species.new
  end

  def update
  end

  def destroy
    @species = Species.find(params[:id])
    @species.destroy
    redirect_to '/species'
  end

  def index
    @species = Species.all
  end

  def create
    @species = Species.new(species_params)
    if @species.save
      # flash[:success] = "You added a species"
      redirect_to @species
    end
  end

  def show
    @species = Species.find(params[:id])
  end
  private
    def species_params
      params.require(:species).permit(:name)
    end
end
