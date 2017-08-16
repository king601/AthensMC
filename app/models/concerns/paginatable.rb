# Paginatable
module Paginatable
  extend ActiveSupport::Concern
  SIZE = 10

  module ClassMethods
    def paginate(params)
      page(params[:page]).per(params[:per_page] || SIZE)
    end
  end
end
