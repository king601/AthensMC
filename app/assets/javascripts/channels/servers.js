console.log($('[data-server]').data('server'));
App.server = App.cable.subscriptions.create(
  {
    channel: 'ServersChannel'
  },
  {
    connected: function() {
      // Called when the subscription is ready for use on the server
      // console.log('connected');
    },

    disconnected: function() {
      // Called when the subscription has been terminated by the server
      // console.log('disconnected');
    },

    received: function(data) {
      // Called when there's incoming data on the websocket for this channel
      // console.log(data);
      if (data.server_id == $('[data-server]').data('server')) {
        $("[data-behavior='rcon-response']").append(data.html);
      } else {
        console.log('server id of recieived message did not match');
      }
    },
    send_command: function(command) {
      this.perform('send_command', {
        server_id: $('[data-server]').data('server'),
        command: command
      });
    }
  }
);
