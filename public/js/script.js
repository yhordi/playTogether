$(document).ready(function(){
  var steam = new Steam
  var controller = new Controller(steam)
  controller.bindListeners()
});

var Steam = function(){
  var userInput = this.userInput
}

Steam.prototype = {
  getInfoBasedOnId: function(userInput){
    var here = this
    $.ajax({
      dataType: 'json',
      type: 'POST',
      url: '/user/Id',
      data: { Id: userInput },
      success: function(data){
        here.injectResponse(data)
      },
      error: function (bug) {
        console.log("error:")
        console.log(bug)
      },
      complete: function (data) {
        var status = data.status
      }
    })
  },
  getId: function(userInput){
    var here = this
    $.ajax({
      dataType: 'json',
      type: 'POST',
      url: '/user/Url',
      data: { Url: userInput },
      success: function(data){
        console.log("SUCCESS!")
        data = data.response.steamid
        here.getInfoBasedOnId(data)
      },
      error: function (bug) {
        console.log("error:")
        console.log(bug)
      },
      complete: function (data) {
        var status = data.status
      }
    })
  },
  checkUserInput: function(){
    userInput = $('.urlOrId').val()
    var here = this
    if (userInput.length == 17) {
      here.steam.getInfoBasedOnId(userInput)
    } else {
      here.steam.getId(userInput)
    }
  },
  injectResponse: function(data) {
    // debugger
    var playerData = data.response.players[0]
    $(".avatar").html("<img src =" + playerData.avatarfull + "/>")
    $(".userName").html('Username: '+ playerData.personaname)
    $(".realName").html('Name: ' + playerData.realname)
<<<<<<< HEAD
    $(".steamId").html('Name: ' + playerData.steamid)
    // debugger
    this.getFriends(playerData.steamid)
  },
  getFriends: function(data){
    var here = this
    $.ajax({
      dataType: 'json',
      type: 'POST',
      url: '/friends',
      data: { Id: data },
      success: function(data){
        console.log(data)
        console.log("SUCCESS!")
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
=======
    $('.steam64id').html('Steam64 ID: ' + playerData.steamid)
>>>>>>> master
  }
}

