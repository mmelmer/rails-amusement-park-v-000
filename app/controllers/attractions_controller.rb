class AttractionsController < ApplicationController

  def index
    @user = User.find_by(session[:user_id])
    @attractions = Attraction.all
  end

  def show
    @ride = Ride.new
    @attraction = Attraction.find(params[:id])
    @user = User.find_by(session[:user_id])
    session[:attraction_id] = @attraction.id
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      render :new
    end
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    if @attraction.update(attraction_params)
      redirect_to @attraction
    else
      render :edit
    end
  end

  private

    def attraction_params
      params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
    end

end