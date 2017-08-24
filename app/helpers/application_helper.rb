module ApplicationHelper
  def page_title(page_title)
    content_for(:title) { page_title }
  end

  def bootstrap_class_for(flash_type)
    { success: 'alert-success', error: 'alert-danger', alert: 'alert-danger',
      notice: 'alert-info' }[flash_type.to_sym] || flash_type.to_s
  end

  def flash_messages(_opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert flash-message #{bootstrap_class_for(msg_type)} alert-dismissible", role: 'alert') do
        concat(content_tag(:button, class: 'close', data: { dismiss: 'alert' }) do
          concat content_tag(:span, '&times;'.html_safe, 'aria-hidden' => true)
          concat content_tag(:span, 'Close', class: 'sr-only')
        end)
        concat message
      end)
    end
    nil
  end

  def forum_post_classes(forum_post)
    klasses = []
    klasses << "original-poster" if forum_post.user == @forum_thread.user
    klasses
  end

  def user_badges(user)
    badges = []
    badges << content_tag(:span, 'Admin', class: 'badge badge-danger') if user.admin?
    badges << content_tag(:span, 'Whitelisted', class: 'badge badge-success') if user.whitelisted?
    badges.join(' ').html_safe
  end
end
