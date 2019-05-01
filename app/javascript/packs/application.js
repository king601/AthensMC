/* eslint no-console:0 */

require("@rails/ujs").start()
require("turbolinks").start()

import "bootstrap"
import "../stylesheets/application"

const feather = require('feather-icons');
import RconConsole from './servers/RconConsole';

class Dispatcher {
  constructor() {
    this.pageName = document.body.dataset.page;
  }

  route() {
    switch (this.pageName) {
      case 'admin:servers:show':
        new RconConsole().init();
        break;
    }
  }

  feather() {
    feather.replace();
  }
}

document.addEventListener('turbolinks:load', () => {
  const dispatcher = new Dispatcher();

  dispatcher.feather();
  dispatcher.route();
  $('[data-toggle="tooltip"]').tooltip();
  $('[data-toggle="popover"]').popover();
});
