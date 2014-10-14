function Controller(steam) {
  this.steam = steam
}

Controller.prototype = {
  bindListeners: function() {
    $gobutton = $('.go')
    $gobutton.click(this.steam.checkUserInput.bind(this))
    // $('form').on('submit', this.steam.checkUserInput.bind(this))
  }
}