module Admin
  module WhitelistRequests
    class ChartsController < Admin::WhitelistRequests::BaseController
      def index
        # TODO: Facade me
        @whitelist_requests_chart = WhitelistRequest.current_month.
          group_by_day(:created_at).count
        @whitelist_requests_by_status = WhitelistRequest.current_month.group(:status).
          group_by_week(:created_at).count
        @last_month_chart = WhitelistRequest.last_month.
          group_by_day(:created_at).count
      end
    end
  end
end
