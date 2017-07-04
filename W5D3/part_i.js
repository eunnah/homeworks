// function mysteryScoping1() {
//   var x = 'out of block';
//   if (true) {
//     var x = 'in block';
//     console.log(x);
//   }
//   console.log(x);
// }
//
// mysteryScoping1();

// function mysteryScoping2() {
//   const x = 'out of block';
//   if (true) {
//     const x = 'in block';
//     console.log(x);
//   }
//   console.log(x);
// }
//
// mysteryScoping2();

// this one throws an error
// function mysteryScoping3() {
//   const x = 'out of block';
//   if (true) {
//     var x = 'in block';
//     console.log(x);
//   }
//   console.log(x);
// }
//
// mysteryScoping3();

// function mysteryScoping4() {
//   let x = 'out of block';
//   if (true) {
//     let x = 'in block';
//     console.log(x);
//   }
//   console.log(x);
// }
//
// mysteryScoping4();

// function mysteryScoping5() {
//   let x = 'out of block';
//   if (true) {
//     let x = 'in block';
//     console.log(x);
//   }
//   let x = 'out of block again';
//   console.log(x);
// }
//
// mysteryScoping5();


// function madLib (verb, adjective, noun) {
//   verb = verb.toUpperCase();
//   adjective = adjective.toUpperCase();
//   noun = noun.toUpperCase();
//   console.log(`We shall ${verb} the ${adjective} ${noun}.`);
// }
//
// madLib('make', 'best', 'guac');
//
// function isSubstring (searchString, subString) {
//   return searchString.includes(subString);
// }
//
// console.log(isSubstring("time to program", "time"));
// console.log(isSubstring("Jump for joy", "joys"));

// function fizzBuzz (array) {
//   let new_arr = [];
//   for (var i = 0; i < array.length; i++) {
//     if(array[i] % 3 === 0 && array[i] % 5 === 0) {
//       continue;
//     }
//     else if (array[i] % 3 === 0 ) {
//       new_arr.push(array[i]);
//     }
//     else if (array[i] % 5 === 0 ) {
//       new_arr.push(array[i]);
//     }
//   }
//   return new_arr;
// }
//
// console.log(fizzBuzz([1,2,3,4,5,6,7,8,9,10, 15, 18, 20, 30, 31]));

function isPrime (number) {

  if(number === 2) {
    return true;
  }

  for (var i = 2; i < number; i++) {
    if (number % i === 0) {
      return false;
    }
  }
  return true;
}

console.log(isPrime(2));
console.log(isPrime(10));
console.log(isPrime(15485863));
console.log(isPrime(3548563));

function firstNPrimes (n) {
  let primeCounter = 0;
  let index = 2;
  let result = [];
  while (primeCounter < n) {
    if (isPrime(index)) {
      primeCounter++;
      result.push(index);
    }
    index++;
  }
  return result;
}

function sumOfNPrimes (n) {
  let primes = firstNPrimes(n);
  let sum = 0;
  for (var i = 0; i < primes.length; i++) {
    sum += primes[i];
  }
  return sum;
}

console.log(sumOfNPrimes(0));
console.log(sumOfNPrimes(1));
console.log(sumOfNPrimes(4));
