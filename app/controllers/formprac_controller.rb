class FormpracController < ApplicationController
  def index
  end
  
  def create
	
  end
  
  def accept
  render plain:params.inspect
  end

  end
