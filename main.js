/** @format */

let firstName = "Jacob"; //Variable that holds data, value has been set;
const age = 13; //Variable that is constant, the value cannot be changed
let trueBool = true; //Boolean variable, true or false.

const nameInput = document.getElementById("name"); //Stored the element with id="name" into this variable
const ageInput = document.getElementById("age"); // This lets us access the value of this element in our function below
const outputElement = document.getElementById("output");

///function functionName (parameters){}
/** @summary
 * Linked to a button. When the button is pressed this function will run.
 * @description Changes the value of an element
 * @returns null
 */
function printNameAge() {
  //Changes the text of the outputElement = values from input fields...
  outputElement.textContent = `Name: ${nameInput.value}. Age: ${ageInput.value}`;
}
