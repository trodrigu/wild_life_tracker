class SpeciesPicsController < ApplicationController
  def index
    @images = SpeciesPic.all
    @image = SpeciesPic.new
  end

  def create
    @image = SpeciesPic.new(image_params)

    if @image.save
      render json: { message: "success", fileID: @image.id }, status: 200
    else
      render json: { error: @image.errors.full_messages.join(',')}, status: 400
    end
  end
  private
  def image_params
    params.require(:species_pic).permit(species: :avatar)
  end
end
