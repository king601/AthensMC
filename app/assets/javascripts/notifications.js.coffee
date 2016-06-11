class Notifications
  constructor: ->
    @setEvents()
    @loadNotifications()

    if !window.notifications_interval?
      window.notifications_interval = setInterval(@loadNotifications, 5000)

  setEvents: ->
    $("[data-behavior='notifications']").on "click", @handleClick

  loadNotifications: =>
    $.ajax(
      method: "GET"
      url: "/notifications.json"
      dataType: "JSON"
      success: @handleLoading
    )

  handleLoading: (data) =>
    unread = 0
    $.each data, (i, notification) ->
      unread += 1 if notification.read_at == null

    # Update unread count
    @updateUnreadCount(unread)

    # Generate menu items
    items = $.map data, (notification) ->
      notification["template"]

    # Update page
    $("[data-behavior='notifications-list']").html(items.join("<li class='divider'></li>"))

  handleClick: =>
    $.ajax(
      method: "POST"
      url: "/notifications/mark_as_read"
      dataType: "JSON"
      success: =>
        @updateUnreadCount(0)
    )

  updateUnreadCount: (count) =>
    label = ""

    if count > 0
       label = "<span class='label label-danger'>#{count}</span>"

    $("[data-behavior='notifications-count']").html("<i class='fa fa-bell'></i> #{label} <span class='visible-xs-inline'>Notifications</span>")

jQuery ->
  new Notifications if $("[data-behavior='notifications']").length > 0
