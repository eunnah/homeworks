import React from 'react';

class Calculator extends React.Component{
  constructor(props){
    super(props);
    //your code here
    this.state = { num1: "", num2: "", result: 0 };
    this.setNum1 = this.setNum1.bind(this);
    this.setNum2 = this.setNum2.bind(this);
    this.add = this.add.bind(this);
    this.subtract = this.subtract.bind(this);
    this.multiply = this.multiply.bind(this);
    this.divide = this.divide.bind(this);
    this.clear = this.clear.bind(this);
  }

  //your code here
  setNum1(e) {

    this.setState({num1: e.currentTarget.value});
  }

  setNum2(e) {

    this.setState({num2: e.currentTarget.value});
  }

  add(e) {

    e.preventDefault();
    this.setState({ result: parseInt(this.state.num1) + parseInt(this.state.num2) });
  }

  subtract(e) {

    e.preventDefault();
    this.setState({ result: parseInt(this.state.num1) - parseInt(this.state.num2) });
  }

  multiply(e) {

    e.preventDefault();
    this.setState({ result: parseInt(this.state.num1) * parseInt(this.state.num2) });
  }

  clear(e) {
    e.preventDefault();
    this.setState({ num1: "", num2: "", result: 0 });
  }

  divide(e) {
    e.preventDefault();
    this.setState({result: parseInt(this.state.num1) / parseInt(this.state.num2)});
  }

  render(){
    const {num1, num2} = this.state;
    return (
      <div>
        <h1>{this.state.result}</h1>
        <input type="text" onChange={this.setNum1} value={num1}></input>
        <input type="text" onChange={this.setNum2} value={num2}></input>
        <input type="submit" onClick={this.clear} value="Clear"></input>
      <br />
        <input type="submit" onClick={this.add} value="+"></input>
        <input type="submit" onClick={this.subtract} value="-"></input>
        <input type="submit" onClick={this.multiply} value="*"></input>
        <input type="submit" onClick={this.divide} value="/"></input>
      </div>
    );
  }
}

export default Calculator;
