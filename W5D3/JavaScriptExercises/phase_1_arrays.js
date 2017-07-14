let z = new Array;

Array.prototype.uniq = function(arr) {
  let result = [];
  for (let i=0; i < arr.length; i++) {
    if (!result.includes(arr[i])) {
      result.push(arr[i]);
    }
  }
  return result;
};

z.uniq([30, 30, 30, 33, 34]);

Array.prototype.twoSum = function(arr) {
  const result = [];

  for (let i = 0; i < (arr.length - 1); i++) {
    for (let j = 1; j < arr.length; j++) {
      if (arr[i] + arr[j] === 0) {
        result.push([i, j]);
      }
    }
  }

  return result;
};

let t = [-2, 2, 4, 5, 2, -4];
z.twoSum(t);

Array.prototype.transpose = function(arr) {
  let result = [];
  const cols = arr[0].length;
  const rows = arr.length;

  for (let col = 0; col < cols; col++) {
    result[col] = [];

    for (let row = 0; row < rows; row++) {
      result[col][row] = arr[row][col];
    }
  }

  return result;
};

z.transpose([[1, 2, 3], [4, 5, 6], [7, 8, 9]]);
