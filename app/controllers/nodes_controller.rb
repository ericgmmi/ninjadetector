class NodesController < ApplicationController
  def index
  	@nodes = Node.all
  end

  def edit
  	@node = Node.find(params[:id])
  end

  def update
    @node = Node.find(params[:id])
    if @node.update_attributes(node_params)
      flash[:success] = "Node updated"
      redirect_to rogue_path
    else
      render 'edit'
    end
  end

  def node_params
  	params.require(:node).permit(:name, :ip_address, :mac_address, :authorization)
  end

  def snmpscan
    
  end

  def approve
    @node = Node.find(params[:id])
    @node.update_attributes(:authorization => 'Admin')
    redirect_to rogue_path
  end

  def show
    @node = Node.find(params[:id])
  end

end
