class CommentsController < ApplicationController
  def new
    @category = Category.find_by(id: params[:category_id]) or not_found
    @film = Film.find_by(id: params[:film_id]) or not_found
    @comment = Comment.new
  end

  def create
    @category = Category.find_by(id: params[:category_id]) or not_found
    @film = Film.find_by(id: params[:film_id]) or not_found

    @comment = Comment.new(comment_params)
    @comment.user = get_user_from_name
    @comment.film = @film

    if @comment.save
      redirect_to category_film_path(@category, @film), notice: "Comment was successfully added."
    else
      render :action => "new"
    end
  end

  def edit
    @category = Category.find_by(id: params[:category_id]) or not_found
    @film = Film.find_by(id: params[:film_id]) or not_found
    @comment = Comment.find_by(id: params[:id]) or not_found
  end

  def update
    category = Category.find_by(id: params[:category_id]) or not_found
    film = Film.find_by(id: params[:film_id]) or not_found
    @comment = Comment.find_by(id: params[:id]) or not_found

    if @comment.update_attributes(comment_params)
      redirect_to category_film_path(category, film), notice: "Comment was successfully edited."
    else
      render :action => "edit"
    end
  end

  def destroy
    category = Category.find_by(id: params[:category_id]) or not_found
    film = Film.find_by(id: params[:film_id]) or not_found
    comment = Comment.find_by(id: params[:id]) or not_found

    comment.destroy

    redirect_to category_film_path(category, film), notice: "Comment was successfully deleted."
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

  def get_user_from_name
    user = User.find_by_name(params[:user_name])

    if user == nil
      user = User.new(name: params[:user_name], type_mask: 2)
      user.save
    end

    user
  end
end
