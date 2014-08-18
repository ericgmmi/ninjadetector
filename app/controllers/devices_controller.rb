class DevicesController < ApplicationController
  def index
  	@devices = Device.all.order(:city, :device_type, :ip_address, :name)
  end

  def create
  	@device = Device.create(device_params)
  	redirect_to devices_path
  end

  def edit
    @device = Device.find(params[:id])
  end

  def update
    @device = Device.find(params[:id])
    if @device.update_attributes(device_params)
      flash[:success] = "Device updated"
      redirect_to configure_path
    else
      render 'edit'
    end
  end

  def routers
    @router = Device.where(:device_type => 'Router')
  end

  def destroy
    Device.find(params[:id]).destroy
    redirect_to configure_path
  end

  def device_params
  	params.require(:device).permit(:name, :ip_address, :device_type, :community)
  end
end
