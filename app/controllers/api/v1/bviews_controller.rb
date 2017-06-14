class Api::V1::BviewsController < ApplicationController
	
	before_filter :restrict_access
	
  def index
		if(params[:title]&&!params[:summary])
			@view=Bview.where(title:params[:title])
		elsif(params[:summary]&&!params[:title])
			@view=Bview.where(summary:params[:summary])
		elsif(params[:summary]&&params[:title])
			@view1=Bview.where(summary:params[:summary])
			@view=@view1.where(title:params[:title])
		else
			@view=Bview.all
		end
	
	render json:@view, status: :ok
  end

  def show
	@view=Bview.where(id:params[:id])
	render json:@view
	#render plain:params.inspect
  end

  def create
	@view=current_user.bviews.build(bview_params)
	if @view.save
	render json:@view,status: :created
	else
	render json:@contact.errors, status: :unprocessible_identity
	end
  end

  def destroy
	@view=Bview.find(params[:id])
	@view.destroy
  end

  def update
	@view=Bview.find(params[:id])
	@view.update(bview_params)
	render json:@view, status: :updated
  end
  
  private
  def bview_params
	params.require(:bview).permit(:title,:summary)
  end
  
  # def restrict_access
	# api_key= ApiKey.find_by_access_token(params[:access_token])	
	# head :unauthorized unless api_key
  # end
  
     def restrict_access
	 authenticate_or_request_with_http_token do |token,options|
	 ApiKey.exists?(access_token: token)
	 end
	 end
  
end
