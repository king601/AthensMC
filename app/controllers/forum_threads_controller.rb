class ForumThreadsController < ApplicationController
  before_action :authenticate_user!, except: %w(index show)
  before_action :set_forum_thread, except: %w(index new create)

  def index
    @forum_threads = ForumThread.search(search_query, search_params)
    authorize @forum_threads
  end

  def edit
  end

  def update
    if @forum_thread.update(forum_thread_params)
      redirect_to @forum_thread, notice: 'Updated title of forum thread'
    else
      render 'edit', alert: 'An unknown error occurred, please try again.'
    end
  end

  def new
    @forum_thread = current_user.forum_threads.new
    @forum_thread.forum_posts.new
    authorize @forum_thread
  end

  def create
    @forum_thread = current_user.forum_threads.build(forum_thread_params)
    @forum_thread.forum_posts.first.user = current_user
    authorize @forum_thread

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

  def destroy
    @forum_thread.forum_posts.destroy_all
    @forum_thread.destroy
    redirect_to forum_threads_path, notice: 'Forum Thread has been removed.'
  end

  def sticky
    @forum_thread.update_attributes(sticky: true)
    redirect_to @forum_thread, notice: "#{@forum_thread.subject} has been stickied!"
  end

  def unsticky
    @forum_thread.update_attributes(sticky: false)
    redirect_to @forum_thread, notice: "#{@forum_thread.subject} has been un-stickied!"
  end

  private

  def forum_thread_params
    params.require(:forum_thread).permit(:subject,
                                         forum_posts_attributes: [:body])
  end

  def set_forum_thread
    @forum_thread = ForumThread.friendly.find(params[:id])
    authorize @forum_thread
  end

  def search_query
    params[:q].presence || "*"
  end

  def search_params
    {
     order: { sticky: :desc,
              last_post_created_at: :desc },
     page: params[:page],
     per_page: 10
    }
  end
end
