function sum(args) {
  let arr = Array.prototype.slice.call(arguments);
  let total = arr.reduce((a, b) => a + b, 0);
  return total;
}

function sum2(...args) {
  return args.reduce((a, b) => a + b, 0);
}

// console.log(sum2(1, 2, 3, 4) === 10);
// console.log(sum2(1, 2, 3, 4, 5) === 15);

Function.prototype.myBind = function() {
  let fn = this;
  let arr = Array.from(arguments);
  return function(){
    let arr2 = Array.from(arguments);
    return fn.apply(arr[0],arr.slice(1).concat(arr2));
  };
};

Function.prototype.myBind2 = function(...bindargs) {
  let fn = this;
  let arr = bindargs;
  return function(...callargs){
    let arr2 = callargs;
    return fn.apply(arr[0],arr.slice(1).concat(arr2));
  };
};

class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

const markov = new Cat("Markov");
const breakfast = new Cat("Breakfast");

// markov.says("meow", "Ned");
// // Markov says meow to Ned!
// // true
//
// // bind time args are "meow" and "Kush", no call time args
// markov.says.myBind(breakfast, "meow", "Kush")();
// // Breakfast says meow to Kush!
// // true
//
// // no bind time args (other than context), call time args are "meow" and "me"
// markov.says.myBind(breakfast)("meow", "a tree");
// // Breakfast says meow to a tree!
// // true
//
// // bind time arg is "meow", call time arg is "Markov"
// markov.says.myBind(breakfast, "meow")("Markov");
// // Breakfast says meow to Markov!
// // true
//
// // no bind time args (other than context), call time args are "meow" and "me"
// const notMarkovSays = markov.says.myBind(breakfast);
// notMarkovSays("meow", "me");
// // Breakfast says meow to me!
// // true
//
// markov.says("meow", "Ned");
// // Markov says meow to Ned!
// // true
//
// // bind time args are "meow" and "Kush", no call time args
// markov.says.myBind2(breakfast, "meow", "Kush")();
// // Breakfast says meow to Kush!
// // true
//
// // no bind time args (other than context), call time args are "meow" and "me"
// markov.says.myBind2(breakfast)("meow", "a tree");
// // Breakfast says meow to a tree!
// // true
//
// // bind time arg is "meow", call time arg is "Markov"
// markov.says.myBind2(breakfast, "meow")("Markov");
// // Breakfast says meow to Markov!
// // true
//
// // no bind time args (other than context), call time args are "meow" and "me"
// const notMarkovSays2 = markov.says.myBind2(breakfast);
// notMarkovSays2("meow", "me");
// // Breakfast says meow to me!
// // true

function curriedSum(numArgs) {
  let numbers = [];

  return function _curriedSum(num) {
    numbers.push(num);

    if (numbers.length === numArgs) {
      return numbers.reduce((acc, val) => acc + val, 0);
    }
    else {
      return _curriedSum;
    }
  };
}

const total = curriedSum(4);
console.log(total(5)(30)(20)(1)); // => 56


Function.prototype.curry = function(numArgs) {
  let numbers = [];
  let that = this;

  return function _curry(num) {
    numbers.push(num);

    if (numbers.length === numArgs) {
      //return numbers.reduce((acc, val) => acc + val, 0);
      // console.log(...numbers);
      //this.bind(sumThree, ...numbers);
      // console.log(that);
      return that.call(that, ...numbers);
    }
    else {
      //return this.apply(this,...numArgs);
      return _curry;
    }
  };
};

function sumThree(num1, num2, num3) {
  return num1 + num2 + num3;
}

console.log(sumThree.curry(3)(4)(20)(6)); // == 30
