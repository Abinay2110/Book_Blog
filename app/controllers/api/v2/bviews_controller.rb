class Api::V2::BviewsController < ApplicationController

  
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
	@view= Bview.new(bview_params)
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
end
