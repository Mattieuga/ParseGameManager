var GameManager = require('cloud/game_matching.js');

Parse.Cloud.define("joinNewGame", function(request, response) {
  console.log("Incoming join request from " + request.user);
  
  if (request.user) {
    GameManager.joinAnonymousGame(request.user, {
      success: function(match, isTurn) {
        response.success(match);
      },
      error: function(error) {
        console.log(error);
        response.error("An error has occured.");
      }
    });
  } else {
    response.error("Authentication failed");
  }
});