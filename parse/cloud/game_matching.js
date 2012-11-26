// === Model classes and keys ===

var _matchClassName = "Match";
var _matchLockKey = "gameLock";
var _matchLockKeyInitial = 1;
var _matchLockKeyMax = 2;
var _matchPlayer1Key = "player1";
var _matchPlayer2Key = "player2";
var _matchStatusKey = "gameStatus";
var _matchStatusKeyWaiting = "waiting";
var _matchStatusKeyInProgress = "in_progress";
var _matchStatusKeyFinished = "finished";
var _matchStatusKeyCancelled = "cancelled";
var _matchTurnKey = "turn";
var _matchTurnKeyPlayer1 = "player_1";
var _matchTurnKeyPlayer2 = "player_2";

var Match = Parse.Object.extend(_matchClassName);

// === Overridable methods ===
// TODO all these
exports.initialize = function(){};
exports.beforeMatchCreated = function(){};
exports.afterMatchCreated = function(){};
exports.beforeMatchJoined = function(){};
exports.afterMatchJoined = function(){};
exports.beforeTurnChange = function(){};
exports.afterTurnChange = function(){};

// === API methods ===

exports.joinAnonymousGame = function(player, options) {
  _log("Joining anonymous game", player);
  // Find number of available games
  var matchQuery = new Parse.Query(Match);
  matchQuery.equalTo(_matchStatusKey, _matchStatusKeyWaiting);
  matchQuery.notEqualTo(_matchPlayer1Key, player); // Can't play with yourself

  matchQuery.count({
    success: function(count) {
      _log("Found " + count + " available games: ", player);
      if (count > 0) {
        // If matches were found, fetch random one
        var row = Math.floor(Math.random()*count);
        matchQuery.limit(1);
        matchQuery.skip(row); // random num is 0 to count-1 so we can use it as skip directly
        matchQuery.find({
          success: function(results) {
            _log("Fetched random game: " + JSON.stringify(results[0]), player);
            if (results.length > 0) {
              // Attempt to join fetched game
              _log("Attempting to join game: " + JSON.stringify(results[0]), player);
              _joinMatchAttempt(results[0], player, options);
            } else {
              // If something happened to the match give up and create a new one
              _log("Creating new game since random selection not found", player);
              _createNewMatch(player, options);
            }
          },
        error: options.error });
      } else {
        // If no matches were found, create new one
        _log("Creating new game since no available games were found", player);
        _createNewMatch(player, options);
      }
    },
  error: options.error });
};


// === Core methods ===

_joinMatchAttempt = function(match, player, options) {
  // get random match returned
  match.increment(_matchLockKey);
  match.save(null, {
    success: function(updatedMatch) {
      _log("Incremented lock, game data is now: " + JSON.stringify(updatedMatch), player);
      // Check if the join succeeded
      if (updatedMatch.get(_matchLockKey) <= _matchLockKeyMax) {
        _log("Game lock successful, joining game.", player);
        match.set(_matchPlayer2Key, player);
        match.set(_matchStatusKey, _matchStatusKeyInProgress);
        match.save(null, {
          success: function(newMatch) {
            // Return the game
            var isTurn = newMatch.get(_matchTurnKey) === _matchTurnKeyPlayer2;
            _log("Game joined, and it isTurn is : " + isTurn, player);
            _log(JSON.stringify(newMatch), player);
            options.success(newMatch, isTurn);
          },
        error: options.error });
      } else {
        // If someone else joined game first, give up and create new one
        console.error("COLLISION");
        _log("Game lock failed, giving up and creating new game.", player);
        _createNewMatch(player, options);
      }
    }, 
  error: options.error });
};

_createNewMatch = function(player, options) {
  // Set new match attributes
  var match = new (Parse.Object.extend(_matchClassName))();
  match.set(_matchLockKey, _matchLockKeyInitial);
  match.set(_matchPlayer1Key, player); // challenger is player 1
  match.set(_matchStatusKey, _matchStatusKeyWaiting); // wait for second player
  match.set(_matchTurnKey, _matchTurnKeyPlayer1); // default challenger starts

  _log("Creating new game with properties:", player);
  _log(JSON.stringify(match), player);
  // Create match
  match.save(null, {
    success: function(newMatch) {
      // Return the game
      _log("Game created successfully, now waiting for players", player);
      _log(JSON.stringify(newMatch), player);
      options.success(newMatch, true);
    },
  error: options.error });
};

_log = function(message, player) {
  console.log(player.get("username") + "$ " + message);
};
