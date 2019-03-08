class LikesController < ApplicationController

  def create
    @like = Like.new(like_params)
    @like.liker_id = current_user.id
    if @like.save
      set_dog.likes_count += 1
       respond_to do |format|
        format.html {redirect_to root_path}
       end
    else
      render json: @dog.errors.full_messages, status: 422
    end
  end

  def destroy
    @like =  Like.where(liker_id: current_user.id).where(dog_id: params[:dog_id])[0]
    @dog = Dog.find(@like.dog_id)
    @like.destroy
    set_dog.likes_count -= 1
   respond_to do |format|
        format.html {redirect_to root_path}
       end
  end

  private
  def like_params
    params.permit(:dog_id, :liker_id)
  end

    def set_dog
      @dog = Dog.find(params[:dog_id])
    end
end