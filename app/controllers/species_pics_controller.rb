class SpeciesPicsController < ApplicationController
  def index
    @image = SpeciesPic.new
    @species = Species.find(params[:id])
    @images = @species.species_pics
    @user = current_user
    respond_to do |format|
      format.js {}
      format.html 
    end
  end

  def create
    @image = SpeciesPic.create(image_params)

    if @image.save
      render json: { message: "success", fileID: @image.id }, status: 200
    else
      render json: { error: @image.errors.full_messages.join(',')}, status: 400
    end
  end

  def destroy
    @image = SpeciesPic.find(params[:id])
    @image.destroy
    redirect_to species_pics_index_path @image.species.id
  end
  private
  def image_params
    params.require(:species_pic).permit(:avatar, :species_id, :user_id)
  end
end
