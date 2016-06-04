class ForumThreadsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_forum_thread, except: [:index, :new, :create]

  def index
    @forum_threads = ForumThread.all.order("last_post_created_at DESC").paginate(page: params[:page], per_page: 10)
  end

  def new
    @forum_thread = current_user.forum_threads.build
    @forum_thread.forum_posts.new
  end

  def create
    @forum_thread = current_user.forum_threads.build(forum_thread_params)
    @forum_thread.forum_posts.first.user_id = current_user.id

    if @forum_thread.save
      @forum_thread.touch(:last_post_created_at)
      redirect_to @forum_thread
    else
      render action: :new
    end
  end

  def show
    @forum_post = ForumPost.new
  end

  private
    def forum_thread_params
      params.require(:forum_thread).permit(:subject, forum_posts_attributes: [:body])
    end

    def set_forum_thread
      @forum_thread = ForumThread.friendly.find(params[:id])
    end
end
