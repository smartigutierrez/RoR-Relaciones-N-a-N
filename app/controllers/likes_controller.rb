class LikesController < ApplicationController
  def create
    if current_user
      @like = current_user.likes.new(like_params)
      if @like.save
        flash[:notice] = @like.errors.full_messages.to_sentence
      end
      redirect_to Post.find(params[:like][:post_id])
    else
      flash[:notice] = "Necesitas ingresar para realizar esta acción."
      redirect_to new_user_session_path
    end
  end

def destroy
  if current_user
    @like = current_user.likes.find(params[:id])
    post_id = @like.post_id
    @like.destroy
    redirect_to Post.find(post_id)
  else
    flash[:notice] = "Necesitas ingresar para realizar esta acción."
    redirect_to new_user_session_path
  end
end

  private

  def like_params
    params.require(:like).permit(:post_id)
  end
end
