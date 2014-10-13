$(document).ready(function(){
  var steam = new Steam
  var controller = new Controller(steam)
  controller.bindListeners()
  var ajaxData = null;
});

var Steam = function(){
}

Steam.prototype = {
  getInfo: function(){
    var here = this
    $.ajax({
      dataType: 'json',
      type: 'GET',
      url: '/HTTParty',
      success: function(data){
        console.log("SUCCESS!")
        here.steam.injectResponse(data)
      },
      error: function (bug) {
        console.log("error:")
        console.log(bug)
      },
      complete: function (data) {
        var status = data.status
        console.log('complete: ' + status)
      }
    })
  },
  injectResponse: function(data) {
    var playerData = data.response.players[0]
    $(".avatar").append("<img src =" + playerData.avatarfull + "/>")
    $(".userName").append(playerData.personaname)
    $(".realName").append(playerData.realname)
  }
}

