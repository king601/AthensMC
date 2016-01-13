require 'slack-notifier'
class SlackNotifierJob < ActiveJob::Base
  queue_as :default

  def perform(whitelist_request)
    # Do something later
    notifier = Slack::Notifier.new Rails.application.secrets.slack_token
    notifier.username = "AthensMC Whitelist System"
    message = "<!channel> #{whitelist_request.user.username} just applied for the community
    \n[View Whitelist Requests](https://athensmc.com/admin/whitelist_requests)"
    Slack::Notifier::LinkFormatter.format(message)
    more_user_info = {
      fallback: "AthensMC Username: #{whitelist_request.user.username}\nMinecraft UUID: #{whitelist_request.user.minecraft_uuid}",
      text: "AthensMC Username: #{whitelist_request.user.username}\nMinecraft UUID: #{whitelist_request.user.minecraft_uuid}\nReferred by: #{whitelist_request.referred_by}",
      color: "good"
    }
    notifier.ping(
      message,
      icon_emoji: ":sparkles:",
      attachments: [more_user_info]
    )
  end
end
