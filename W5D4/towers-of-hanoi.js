const readline = require('readline');
const reader = readline.createInterface( {
  input: process.stdin,
  output: process.stdout
});

class Game {
  constructor(stacks) {
    this.stacks = [[3, 2, 1], [], []];
  }

  run(completionCallback) {
    // until first tower is empty && (second tower is full || third tower is full)
      // ask for tower to move from and to
      // ask again if invalid move, else keep going

    // while (!this.isWon()) {
    //   this.promptMove(function(sIdx, eIdx) {
    //     if (this.isValidMove(sIdx, eIdx)) {
    //       this.move(sIdx, eIdx);
    //     }
    //     else {
    //       console.log("Invalid move");
    //     }
    //   });
    // }
    // console.log('Game over.');
    this.promptMove(function(sIdx, eIdx) {
          //console.log(this);
      if (this.isValidMove(sIdx, eIdx)) {
        this.move(sIdx, eIdx);
      }
      else {
        console.log("Invalid move");
      }

      if (!this.isWon()) {
        this.run(completionCallback);
      }
      else {
        console.log('Game over.');
        reader.close();
      }
    });

    console.log("Will this be reached");
    // setTimeout(function() {console.log("Finished");}, 1000);

  }

  promptMove(callback) {
    console.log(this.stacks);
    let that = this;
    reader.question('Where do you want to move the disc? (start,end): ', function(resp) {
      resp = resp.split(",");
      let [sIdx, eIdx] = resp;
      //console.log(that);
      let boundCallback = callback.bind(that);
      boundCallback(sIdx, eIdx);
    });
    console.log("This will be reached");
  }

  isValidMove(sIdx, eIdx) {
    if(this.stacks[sIdx].slice(-1)[0] > this.stacks[eIdx].slice(-1)[0]) {
      return false;
    }
    else {
      return true;
    }
  }

  move(sIdx, eIdx) {
    this.stacks[eIdx].push(this.stacks[sIdx].pop());

  }

  print() {

  }

  isWon() {
    if (this.stacks[0].length === 0 && (this.stacks[1].length === 0 || this.stacks[2].length === 0)) {
      return true;
    }
    else {
      return false;
    }
  }
}

const game = new Game().run();
