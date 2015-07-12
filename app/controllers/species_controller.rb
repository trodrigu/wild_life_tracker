class SpeciesController < ApplicationController
  def new
    @species = Species.new
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

  def index
    @species = Species.all
  end


  private
    def species_params
      params.require(:species).permit(:name)
    end
end
