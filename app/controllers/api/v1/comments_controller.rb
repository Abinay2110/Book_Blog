class Api::V1::CommentsController < ApplicationController
	
	before_action :restrict_access
	
 include ActionController::HttpAuthentication::Basic::ControllerMethods
http_basic_authenticate_with name: "abi", password: "test",only:[:create, :destroy]

def create
	@view=Bview.find(params[:bview_id])
	@comment=@view.comments.new(comment_params)
	@comment.save
	
end

def destroy
	@view=Bview.find(params[:bview_id])
	@comment=@view.comments.find(params[:id])
	@comment.destroy
end

private
def comment_params
params.require(:comment).permit(:commenter,:body)
end
 def restrict_access
	 authenticate_or_request_with_http_token do |token,options|
	 ApiKey.exists?(access_token: token)
	 end
end
end