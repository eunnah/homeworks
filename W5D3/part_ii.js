// function titleize(array, callback) {
//   let newArr = array.map(callback);
//   newArr.forEach(function displayName(name) {
//     console.log(name);
//   });
// }
//
// function printCallback(name) {
//   return `Mx. ${name} Jingleheimer Schmidt`;
// }
//
// titleize(["Mary", "Brian", "Leo"], printCallback);
//

function Elephant(name, height, tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks;
}

Elephant.prototype.trumpet = function () {
  console.log(`${this.name} the elephant goes 'phrRRRRRRRRRRR!!!!!!!'`);
};

Elephant.prototype.grow = function () {
  this.height += 12;
};

Elephant.prototype.addTrick = function (trick) {
  this.tricks.push(trick);
};

Elephant.prototype.play = function () {
  let min = Math.ceil(0);
  let max = Math.floor(this.tricks.length - 1);
  console.log(`${this.name} is ${this.tricks[Math.floor(Math.random() * (max - min + 1)) + min]}`); //The maximum is inclusive and the minimum is inclusive
};

let bobby = new Elephant("Bobby", 4, ["eating chocolate", "playing around", "sleeping"]);
bobby.trumpet();
console.log(bobby.height);
bobby.grow();
console.log(bobby.height);
bobby.addTrick("reading a book");
bobby.play();
bobby.play();
bobby.play();

let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

Elephant.paradeHelper = function (elephant) {
  console.log(`${elephant.name} is trotting by!`);
};

herd.forEach(Elephant.paradeHelper);

function dinerBreakfast () {
  let order = "I'd like cheesy scrambled eggs";
  console.log(order + " please.");

  return function (addOn) {
    order = order + " and " + addOn;
    console.log(`${order} please.`);
  };
}

let bfastOrder = dinerBreakfast();
bfastOrder("chocolate chip pancakes");
bfastOrder("grits");
bfastOrder("tissues");
bfastOrder("bibimbap");
