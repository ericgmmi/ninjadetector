class LocationsController < ApplicationController
  def index
  	@locations = Location.all.order(:state)
  end
end
