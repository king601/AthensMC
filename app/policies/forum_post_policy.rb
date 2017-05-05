# ForumPostPolicy
class ForumPostPolicy < ApplicationPolicy
  attr_reader :user, :forum_post

  def initialize(user, forum_post)
    @user = user
    @forum_post = forum_post
  end

  %w(index show ).each do |action|
    define_method("#{action}?") do
      true
    end
  end

  %w(new create).each do |action|
    define_method("#{action}?") do
      true
    end
  end

  %w(edit update).each do |action|
    define_method("#{action}?") do
      owner?(forum_post) || user.admin?
    end
  end

  %w(destroy).each do |action|
    define_method("#{action}?") do
      user.admin?
    end
  end

  # ForumPostPolicy Scope
  class Scope < Scope
    def resolve
      scope
    end
  end
end
