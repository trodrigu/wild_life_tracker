class SightingsController < ApplicationController
  def new
    @species = Species.find(params[:species_id])
    puts @species
    @sightings = @species.sightings.build
  end

  def create
    @species = Species.find(params[:id])
    @sightings = @species.sightings.new(sightings_params)
    if @sightings.save
      redirect_to @sightings
    end
  end

  def destroy
    @species = Species.find(params[:id])
    @species.sightings.destroy
    redirect_to '/species'
  end

  def show
    @species = Species.find(params[:species_id])
    @sightings = Sightings.find(params[:id])
  end

  private
    def sightings_params
      params.require(:sightings).permit(:latitude, :longitude, :date)
    end
end
