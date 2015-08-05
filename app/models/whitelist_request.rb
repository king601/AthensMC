class WhitelistRequest < ActiveRecord::Base
  belongs_to :user

  validates :agree_rules, presence: { :message => "You need to agree to the Community Rules" }

  scope :status, -> (status) { where(status: status) } #WhitelistRequest.status("pending") || WhitelistRequest.status("approved")
  scope :agree, -> (agree) { where(agree_rules: agree) }

#  def as_json(options={})
#    ActiveRecord::Base.include_root_in_json = false
#  super(:only => [:id, :status, :user[:minecraft_uuid.to_s]],
#      :include => {
#        :user => {
#          :only => [:minecraft_uuid]
#            }
#      }
#    )
#  end

end
