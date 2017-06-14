class BviewsController < ApplicationController
	
	authorize_resource
	before_action :authenticate_user!,except:[:index, :show]
	
	
  def index
	@view=Bview.all
	respond_to do |format|
	format.html
	format.json { render json: @view}
	end
  end
  
  def new
    @view=current_user.bviews.build
	2.times {@view.comments.build}
  end
  
   def edit
	@view=Bview.find(params[:id])
  end
  
  
  def update
	@bview=Bview.find(params[:id])
	if @bview.update(per)
		redirect_to @bview
	else
		render 'edit'
	end
  end
  
  
  def create
	@view=current_user.bviews.build(per)
	if @view.save
	redirect_to @view
	else
	 render 'new'
	end
  end

  def show
	@view=Bview.find(params[:id])
  end 
  
  def destroy
	@view=Bview.find(params[:id])
	@view.destroy
	redirect_to bviews_path
  end
  
  private
  def per
	params.require(:bview).permit(:title,:summary,comments_attributes: [:id,:commenter,:body,:_destroy])
  end
  
 def per1
	params.require(:bview).permit(:title,:summary)
  end
 
end