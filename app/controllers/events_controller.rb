class EventsController < ApplicationController
    before_action :authenticate_admin!, only: [:new, :create]
  
    def index
      @events = Event.all
    end
  
    def show
      @event = Event.find(params[:id])
    end
  
    def new
      @event = Event.new
    end
  
    def create
      @event = Event.new(event_params)
      if @event.save
        redirect_to @event
      else
        render 'new'
      end
    end
  
    private
  
    def event_params
        params.require(:event).permit(:title, :venue, :date, :fees_charged, :poster)
    end
  
    def authenticate_admin!
      unless current_user.has_role?(:admin)
        redirect_to root_path, alert: "You are not authorized to perform this action."
      end
    end
  end
  