module Admin
  # UserPolicy
  class UserPolicy < ApplicationPolicy
   attr_reader :user, :users

   def initialize(user, users)
     @user = user
     @users = users
   end

   %w(index show email_list).each do |action|
     define_method("#{action}?") do
       user.admin?
     end
   end

   def whitelisted?
     # Everyone should have access to view the whitelist
     true
   end

   class Scope < Scope
     def resolve
       scope
     end
   end
 end
end
