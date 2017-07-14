const readline = require('readline');
const reader = readline.createInterface( {
  input: process.stdin,
  output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback) {

  reader.question('Enter number: ', function(num) {
    sum += parseInt(num);
    console.log(sum);
    numsLeft--;

    if (numsLeft === 0) {
      completionCallback(sum);
      reader.close();
      return;
    }

    addNumbers(sum, numsLeft, completionCallback);
  });
}

addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));
