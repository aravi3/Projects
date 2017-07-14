function ran(start, end) {
  if(start === end) {
  return [start];
  }
  return [start].concat(ran(start+1, end));
}

function running(start, end) {
  if (start === end) {
    return [end];
  }
  return running(start, end-1).concat([end]);
}

function sumRec(arr) {
  if (arr.length === 1) {
    return arr[0];
  }

  return arr[0] + sumRec(arr.slice(1));
}

sumRec([3, 4, 5]);

function exponent(base, exp) {
  if (exp === 0) {
    return 1;
  }

  return base * exponent(base, exp-1);
}

exponent(3, 4);

function exponent2(base, exp) {
  if (exp === 0) {
    return 1;
  }

  if (exp % 2 === 0) {
    let subAnswer = exponent2(base, exp/2);
    return subAnswer * subAnswer;
  } else {
    let subAnswer = exponent2(base, (exp - 1)/2);
    return base * subAnswer * subAnswer;
  }
}

function fibonacci(n) {
  if (n===1){
    return [0];
  }
  else if (n===2) {
    return [0, 1];
  }
  let x = fibonacci(n-1);

  return x.concat([fibonacci(n-2).slice(-1)[0]+ fibonacci(n-1).slice(-1)[0]]);

}

function bsearch(arr, target) {
    let inx = Math.floor(arr.length/2);


  if (arr[inx] === target){
      return (inx);
  }
  else if (arr[inx] > target && arr.length > 1) {
   return bsearch(arr.slice(0, inx), target);
  }
  else if (arr[inx] < target && arr.length > 1) {
   return bsearch(arr.slice(inx), target);
  }
  else {
    return false;
  }

}

function merge(left, right) {
  let merged = [];

  while (left.length > 0 && right.length > 0) {
    let nextItem = (left[0] < right[0]) ? left.shift() : right.shift();
    merged.push(nextItem);
  }

  return merged.concat(left, right);
}

function mergesort(arr) {
  if (arr.length <= 1) {
    return arr;
  }

  let mid = Math.floor(arr.length/2);
  let left = arr.slice(0, mid);
  let right = arr.slice(mid);

  let left_sorted = mergesort(left);
  let right_sorted = mergesort(right);

  return merge(left_sorted, right_sorted);
}
