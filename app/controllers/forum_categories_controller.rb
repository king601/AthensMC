class ForumCategoriesController < ApplicationController
  before_action :authenticate_user!, except: %w(index)
  before_action :set_category

  def index
    @forum_threads = ForumThread.search(
      search_query, search_params.merge(search_with_category)
    ) if @category.present?
    authorize @forum_threads
    render 'forum_threads/index'
  end

  private

  def set_category
    @category = ForumCategory.friendly.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to forum_threads_path
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

  def search_with_category
    {
      where: { forum_category_id: @category.id }
    }
  end
end
