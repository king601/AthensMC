json.array! @notifications do |notification|
  json.template render partial: "notifications/#{notification.notifiable_type.underscore.pluralize}/#{notification.action}", locals: {notification: notification}, formats: [:html]
  json.read_at notification.read_at
end
