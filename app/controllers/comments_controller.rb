class CommentsController < ApplicationController

def create
	@view=Bview.find(params[:bview_id])
	@comment=@view.comments.create(per)
	redirect_to bview_path(@view)
end

def destroy
	@view=Bview.find(params[:bview_id])
	@comment=@view.comments.find(params[:id])
	@comment.destroy
	redirect_to bview_path(@view)
end

private
def per
	params.require(:comment).permit(:commenter,:body)
end

end
