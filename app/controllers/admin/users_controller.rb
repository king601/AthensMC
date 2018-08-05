# Admin::UsersController
class Admin::UsersController < Admin::BaseController
  skip_before_action :authenticate_user!, only: %w(whitelisted)
  skip_before_action :check_admin_status?, only: %w(whitelisted)

  def index
    @users = User.search(search_params, additional_params)
    authorize [:admin, @users]
  end

  def show
    @user = User.find(params[:id])
    authorize [:admin, @user]
  end

  def whitelisted
    @users = User.joins(:whitelist_request).where('whitelist_requests.status IN (?)', 'approved').references(:whitelist_request)
    respond_to do |format|
      format.html do
        flash[:danger] = 'Sorry only a JSON file is supported here'
        redirect_to admin_whitelist_requests_path
      end
      format.json
    end

    authorize [:admin, @users]
  end

  def email_list
    @users = User.all.order('id ASC')
    authorize [:admin, @users]
  end

  def autocomplete
    render json: User.search(
    		params[:term],
    		fields: [{username: :text_start}],
    			limit: 10,
       misspellings: {below: 5}
    		).map(&:username)
  end

  private

  def search_params
    params[:q].presence || "*"
  end

  def additional_params
    {
     misspellings: { below: 5 },
     page: params[:page],
     per_page: 10,
     suggest: true
    }
  end
end
