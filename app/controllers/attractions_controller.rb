class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all
  end

  def show
    @ride = Ride.new
    @attraction = Attraction.find_by(session[:id])
    session[:attraction_id] = @attraction.id
  end

end