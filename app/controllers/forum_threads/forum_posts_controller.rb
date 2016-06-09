class ForumThreads::ForumPostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_forum_thread

  def create
    @forum_post = @forum_thread.forum_posts.new(forum_post_params)
    @forum_post.user = current_user

    if @forum_post.save
      @forum_thread.touch(:last_post_created_at)
      redirect_to forum_thread_path(@forum_thread, anchor: "forum_post_#{@forum_post.id}"), notice: "Successfully posted!"
    else
      redirect_to @forum_thread, alert: "Unable to save your post"
    end
  end

  def edit
    @forum_post = current_user.forum_posts.find(params[:id])
  end

  def update
    @forum_post = current_user.forum_posts.find(params[:id])

    if @forum_post.update(forum_post_params)
      redirect_to @forum_thread, notice: 'Your post has been updated!'
    else
      render 'edit', alert: 'error occurred'
    end
  end

  private

    def set_forum_thread
      @forum_thread = ForumThread.friendly.find(params[:forum_thread_id])
    end

    def forum_post_params
      params.require(:forum_post).permit(:body)
    end
end
