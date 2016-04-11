class CommentsController < ApplicationController

	def create
    if session[:user_id]
    	@user = User.find(params[:user_id])
      @comment = @user.comments.create(comment_params)
      redirect_to :back
    else
	    @applicant = Applicant.find(params[:applicant_id])
	    @comment = @applicant.comments.create(comment_params)
	    redirect_to applicant_path(@applicant)
	  end
  end

  private
    def comment_params
      params.require(:comment).permit(:comment)
    end
end
