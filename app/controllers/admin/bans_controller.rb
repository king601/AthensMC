module Admin
  class BansController < ApplicationController
    before_action :authenticate_user!
    before_action :set_ban, only: %w(edit update destroy)

    def index
    end

    def show
    end

    def new
    end

    def create
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def set_ban
    end

    def ban_params
      params.require(:ban).permit(
        :reason, :expires, :ip, :name, :uuid
      )
    end
  end
end
