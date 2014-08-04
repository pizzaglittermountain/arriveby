require 'open-uri'
require 'json'

class EventsController < ApplicationController

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
    @event = Event.new
    @event.start_location = params[:start_location].to_s
    @event.end_location = params[:end_location].to_s
    @event.arrival_time = DateTime.parse(params[:arrival_time])
    # @event.duration = @event.get_travel_time
    # @event.departure_time = @event.arrival_time - @event.get_travel_time
    @event.phone_number = params[:phone_number]

    #Need to change redirect


    if @event.save
      redirect_to "/events/#{@event.id}", :notice => "Event created successfully."
    else
      render 'new', :notice => "That's not a place. WTF!"
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    @event.start_location = params[:start_location]
    @event.end_location = params[:end_location]
    @event.arrival_time = DateTime.parse(params[:arrival_time])
    # @event.departure_time = params[:departure_time]
    # @event.duration = params[:duration]
    @event.phone_number = params[:phone_number]

    if @event.save
      redirect_to "/events", :notice => "Event updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @event = Event.find(params[:id])

    @event.destroy

    redirect_to "/events", :notice => "Event deleted."
  end
end
