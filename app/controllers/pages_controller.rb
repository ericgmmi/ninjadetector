class PagesController < ApplicationController
  def home
  end

  def scan
    @switches = Device.where(:device_type => 'Switch')
    @routers = Device.where(:device_type => 'Router')
  end

  def view
  end

  def configure
  end

  def rogue
    @rogues = Node.where(:authorization => 'Rogue')
  end
end
