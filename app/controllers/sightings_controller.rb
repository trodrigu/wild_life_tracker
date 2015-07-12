require 'pry'
class SightingsController < ApplicationController
#  def get_user_address
#    @address = current_user.addresses[0]
#    render json: @address
#  end
#
#  def get_addresses_near_user
#    @address = current_user.addresses[0]
#    @address = Address.near("#{@address.city}, #{@address.state}, US", 30)
#    users = []
#    @address.each {|a| users << a.user_id}
#    @users = User.joins(:boards, :addresses).where(id: users).select('boards.id', :skill_needed, :skills_offered, 'addresses.latitude', 'addresses.longitude')
#    render json: @users
#  end
  def new
    @sightings = Sighting.new
    @species = Species.find(params[:format])
  end

  def create
    @sightings = Sighting.new(sightings_params)
    if @sightings.save
      redirect_to '/species'
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
      params.require(:sighting).permit(:species_id, :location, :date)
    end
end
