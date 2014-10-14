$(document).ready(function(){
  var steam = new Steam
  var controller = new Controller(steam)
  controller.bindListeners()
  var ajaxData = null;
});

var Steam = function(){
}

Steam.prototype = {
  // right now the app uses this to get my steam id based on my vanity url and does nothing with it
  // I want to make it so a user can enter their id or vanity url and get their information
  // There will be an if statement to check whether the user entered their id or vanity url and it will then hit the apropriate api returning the appropriate data
  getInfoBasedOnKey: function(){
    var here = this
    $.ajax({
      dataType: 'json',
      type: 'POST',
      url: '/user/Id',
      success: function(data){
        console.log("SUCCESS!")
        debugger
        here.injectResponse(data)
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
  checkUserInput: function(){
    var here = this
    var userInput = $('.urlOrId').val()
    if (userInput.length == 17) {
      var userInput = parseInt(userInput)
      here.steam.getInfoBasedOnKey(userInput)
    } else {
      // here.steam.getKey(data)
    }
  },
  injectResponse: function(data) {
    var playerData = data.response.players[0]
    $(".avatar").append("<img src =" + playerData.avatarfull + "/>")
    $(".userName").append(playerData.personaname)
    $(".realName").append(playerData.realname)
  }
}

