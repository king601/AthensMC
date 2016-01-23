class WhitelistRequest < ActiveRecord::Base
  belongs_to :user

  validates :agree_rules, presence: { :message => "You need to agree to the Community Rules" }

  scope :status, -> (status) { where(status: status) } #WhitelistRequest.status("pending") || WhitelistRequest.status("approved")
  scope :agree, -> (agree) { where(agree_rules: agree) }

  # All whitelist requests in the current month
  scope :current_month, -> { where("created_at  BETWEEN ? AND ?", Time.zone.now.beginning_of_month, Time.zone.now.end_of_month) }
end
