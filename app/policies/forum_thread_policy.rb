# ForumThreadPolicy
class ForumThreadPolicy < ApplicationPolicy
  attr_reader :user, :forum_thread

  def initialize(user, forum_thread)
    @user = user
    @forum_thread = forum_thread
  end

  %w[index show new create].each do |action|
    define_method("#{action}?") { true }
  end

  %w[edit update].each do |action|
    define_method("#{action}?") { owner?(forum_thread) || user.admin? }
  end

  %w[sticky unsticky destroy].each do |action|
    define_method("#{action}?") { user.admin? }
  end

  # ForumThreadPolicy Scope
  class Scope < Scope
    def resolve
      scope
    end
  end
end
