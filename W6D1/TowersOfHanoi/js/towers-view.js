class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.clickCount = 0;
    this.setupTowers();
    this.clickTower();
  }

  bindEvents() {

  }

  makeMove($disk) {
    // isValidMove(startTowerIdx, endTowerIdx)
    if (this.game.isValidMove(this.fromTower.data("number"), this.toTower.data("number"))) {
      this.game.move(this.fromTower.data("number"), this.toTower.data("number"));
      let $childLi = $(this.fromTower.find(':first-child'));
      this.toTower.prepend($childLi);
      if (this.game.isWon()) {
        this.$el.append($("<h2>").text("You won!"));
        $("ul").off("click");
      }
    }
  }

  clickTower() {
    $("ul").on("click", event => {
      let $tower = $(event.currentTarget);
      this.clickCount += 1;
      this.$el.find("h2").remove();
      this.$el.append($("<h2>").text(this.clickCount === 2 ? "From Tower" : "To Tower"));
      if (this.clickCount === 1) {
        this.fromTower = $tower;
      } else {
        this.toTower = $tower;
        this.clickCount = 0;
        this.makeMove();
      }
    });
  }

  setupTowers() {
    for (let i = 0; i < 3; i++) {
      let $ul = $("<ul>");
      $ul.data("number", i);
      if (i === 0 ) {
        for (let j = 0; j < 3; j++) {
          let $li = $("<li>");
          $li.attr("id", `disc${j}`);
          $ul.append($li);
        }
      }
      this.$el.append($ul);
    }
    // const $ul = $("<ul class='cf'>");
    // for (let i = 0; i < 3; i++) {
    //     for (let j = 0; j < 3; j++) {
    //         let $li = $("<li class='square'>");
    //         $li.data("pos", [i, j]);
    //         $ul.append($li);
    //       }
    //     }
    //     this.$el.append($ul);
  }
}

module.exports = View;
