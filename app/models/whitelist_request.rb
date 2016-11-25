# WhitelistRequest
class WhitelistRequest < ApplicationRecord
  belongs_to :user

  after_create_commit :create_slack_notification unless Rails.env.development?

  validates :agree_rules, presence: { message: 'You need to agree to the Community Rules' }

  scope :status, -> (status) { where(status: status) } # WhitelistRequest.status("pending") || WhitelistRequest.status("approved")
  scope :agree, -> (agree) { where(agree_rules: agree) }

  # All whitelist requests in the current month
  scope :current_month, -> { where('created_at  BETWEEN ? AND ?', Time.zone.now.beginning_of_month, Time.zone.now.end_of_month) }

  scope :last_month, -> { where('created_at  BETWEEN ? AND ?', 1.month.ago,
    Time.zone.now.beginning_of_month) }

  private

  def create_slack_notification
    SlackNotifierJob.perform_later(self)
  end
end
