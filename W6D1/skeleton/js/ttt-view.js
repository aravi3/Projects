class View {
  constructor(game, $el) {
    this.count = 0;
    this.game = game;
    this.$el = $el;
    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    $(".square").on("click", event => {
      let $square = $(event.currentTarget);
      this.game.playMove($square.data("pos"));
      this.makeMove($square);
      if (this.game.isOver()) {
        var winner;
        if (this.count % 2 === 0 ) {
          winner = "X";
        } else {
          winner = "O";
        }
        let h2 = $("<h2>").text("You Win!" + winner);
        this.$el.append(h2);
        $(".square").off("click");
      }
    });
  }

  makeMove($square) {
    if (!$square.hasClass("markedX") && !$square.hasClass("markedO")) {
      if (this.count % 2 === 0) {
        $square.toggleClass("markedO");
      } else {
        $square.toggleClass("markedX");
      }
      this.count++;
    }
  }



  setupBoard() {
    const $ul = $("<ul class='cf'>");
    for (let i = 0; i < 3; i++) {
      for (let j = 0; j < 3; j++) {
        let $li = $("<li class='square'>");
        $li.data("pos", [i, j]);
        $ul.append($li);
      }
    }
    this.$el.append($ul);
  }
}

module.exports = View;
