const HanoiGame = require("../solution/game.js");
const HanoiView = require("./towers-view.js");

$( () => {
  const rootEl = $('.hanoi');
  const game = new HanoiGame();
  new HanoiView(game, rootEl);
});
