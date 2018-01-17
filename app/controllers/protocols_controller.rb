class ProtocolsController < ApplicationController
  def index
  end

  def show
    @protocol = Protocol.find_by(slug: params[:slug])
  end
end
