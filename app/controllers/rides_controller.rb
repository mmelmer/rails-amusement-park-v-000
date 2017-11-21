class RidesController < ApplicationController

  def new
    @ride = Ride.create(:user_id => current_user[:id], :attraction_id => session[:attraction_id])
    @ride.take_ride
    redirect_to user_path(@ride.user)
  end

end