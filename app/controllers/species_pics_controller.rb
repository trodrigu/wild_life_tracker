class SpeciesPicsController < ApplicationController
  def index
    @image = SpeciesPic.new
    @species = Species.find(params[:id])
    @images = @species.species_pics
    respond_to do |format|
      format.js {}
      format.html 
    end
  end

  def new
    @image = SpeciesPic.new
  end

  def create
    @image = SpeciesPic.create(image_params)

    if @image.save
      render json: { message: "success", fileID: @image.id }, status: 200
    else
      render json: { error: @image.errors.full_messages.join(',')}, status: 400
    end
  end
  private
  def image_params
    params.require(:species_pic).permit(:avatar, :species_id)
  end
end
