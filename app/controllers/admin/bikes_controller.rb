class Admin::BikesController < ApplicationController
    before_action :authenticate_admin! # Make sure only admins can access these actions
    before_action :set_bike, only: [:show, :edit, :update, :destroy]
  
    def index
      @bikes = Bike.all
    end
  
    def show
    end
  
    def new
      @bike = Bike.new
    end
  
    def create
      @bike = Bike.new(bike_params)
      if @bike.save
        redirect_to admin_bike_path(@bike), notice: 'Bike was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @bike.update(bike_params)
        redirect_to admin_bike_path(@bike), notice: 'Bike was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @bike.destroy
      redirect_to admin_bikes_path, notice: 'Bike was successfully destroyed.'
    end
  
    private
  
    def set_bike
      @bike = Bike.find(params[:id])
    end
  
    def bike_params
      params.require(:bike).permit(:make, :model, :year, :engine_specifications, :description, :price)
    end
  end
  