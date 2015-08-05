class WhitelistRequest < ActiveRecord::Base
  belongs_to :user

  validates :agree_rules, presence: { :message => "You need to agree to the Community Rules" }

  scope :status, -> (status) { where(status: status) } #WhitelistRequest.status("pending") || WhitelistRequest.status("approved")
  scope :agree, -> (agree) { where(agree_rules: agree) }


end
