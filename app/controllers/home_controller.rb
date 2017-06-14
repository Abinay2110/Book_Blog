class HomeController < ApplicationController
  def index
	@token=ApiKey.create!
	
  end
end
