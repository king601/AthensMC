class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { in: 2..32 }
  validates :username, format: {message: "can only contain letters, numbers, underscores or dashes.", with: /\A[A-Za-z0-9\-\_]+\z/ }

  #validates :minecraft_uuid, presence: true
  validates :minecraft_uuid, presence: true, uniqueness: { case_sensitive: false }, :on => [ :update ]

  has_many :revisions
  has_many :casts

  attr_accessor :dashed_uuid

  #before_update :load_profile

  #def load_profile
  #	profile = MojangApi.get_profile_from_name(minecraft_uuid)
  #	assign_attributes(minecraft_uuid: profile.uuid)
  	#if profile.uuid.nil?
  	#	raise "an error occured"
	#end

  #end


  before_validation :set_uuid, on: :update

  def set_uuid
  	begin
  	  self.minecraft_uuid = MojangApi.get_profile_from_name(minecraft_uuid).uuid	 	
  	 rescue Exception => e
  	 end  
  end

  def dashed_uuid
    unless self.minecraft_uuid.nil?
      uuid = self.minecraft_uuid.to_s
      "#{uuid[0..7]}-#{uuid[8..11]}-#{uuid[12..15]}-#{uuid[16..19]}-#{uuid[20..31]}"
    else
      "No UUID associated with this account"
    end
   end

  def minecraft_avatar
    unless self.minecraft_uuid.nil?
      "https://crafatar.com/avatars/#{self.minecraft_uuid}?helm&size=64"
    else
      "https://i.imgur.com/ocJVWAc.png"
    end
  end

end

