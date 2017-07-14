
function times2a(el) {
  return (el * 2);
}

Array.prototype.myEach = function(callback) {
  for (let i=0 ; i < this.length; i++) {
    callback(this[i]);
  }
};


[1,2,3,4,5,6].myEach(times2a);


Array.prototype.myMap = function(callback) {
  let res= [];
  this.myEach(function(el){
    res.push(callback(el));
  });
  return res;
};


[1,2,3,4,5,6].myMap(times2a);



Array.prototype.myReduce = function(callback, startingValue) {
  let i = 0;

  if (!startingValue) {
    startingValue = this[0];
    i++;
  }
  while (i < this.length) {
    startingValue = callback(startingValue,this[i]);
    i++;
  }

  return startingValue;
};

Array.prototype.myReduce = function(callback, startingValue) {

  if (!startingValue) {
    startingValue = this[0];
    var arr = this.slice(1, this.length);
  } else {
    arr = this;
  }

  arr.myEach(function(el) {
    startingValue = callback(startingValue, el);
  });

  return startingValue;
};

// [1, 2, 3].myReduce(function(acc, el) {
//   return acc + el;
// }); // => 6

let v = function(acc, el) {
  return acc + el;};



  [1, 2, 3].myReduce(v); // => 6
