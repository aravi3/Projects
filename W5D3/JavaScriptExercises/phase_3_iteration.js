Array.prototype.bubbleSort = function() {
  let result = this;

  for (let i = 0; i < this.length; i++) {
    let sorted = true;

    for (let j = 0; j < this.length; j++) {
      if (i >= j) {
        continue;
      }

      if (result[i] > result[j]) {
        let temp = result[i];
        result[i] = result[j];
        result[j] = temp;
        sorted = false;
      }
    }

    if (sorted) {
      break;
    }
  }

  return result;
};

Array.prototype.bubbleSort = function() {
  let result = this;
  let sorted = false ;

  while (!sorted) {
    sorted = true;
    for (let i = 0, j = 1; i < (this.length - 1); i++, j++) {
      if (result[i] > result[j]) {
        let temp = result[i];
        result[i] = result[j];
        result[j] = temp;
        sorted = false;
      }
    }
  }

  return result;
};

[0,6,0,2,99,3,2,4,10].bubbleSort();
[3, 4, 7, 5, 8, 9, 2].bubbleSort();

String.prototype.substrings = function() {
  let result = [];
  //result.push(this.slice(0));

  for (let i = 0; i < this.length; i++) {
    for (let j = 0; j < this.length; j++) {
      if (i > j) {
        continue;
      }

      if (!result.includes(this.slice(i, j + 1))) {
        result.push(this.slice(i, j + 1));
      }

    }
  }

  return result;
};

"something".substrings();
