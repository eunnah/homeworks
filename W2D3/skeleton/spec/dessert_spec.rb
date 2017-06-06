require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)!
Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:brownie) { Dessert.new("brownie", 50, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(brownie.type).to eq('brownie')
    end

    it "sets a quantity" do
      expect(brownie.quantity).to eq(50)
    end

    it "starts ingredients as an empty array" do
      expect(brownie.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("brownie", "toy", chef ) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(brownie.ingredients).to_not include('flour')
      brownie.add_ingredient('flour')
      expect(brownie.ingredients).to include('flour')
    end
  end

  describe "#mix!" do
    before(:each) do
      brownie.add_ingredient("flour")
      brownie.add_ingredient("sugar")
      brownie.add_ingredient("cocoa powder")
      brownie.add_ingredient("nutella")
    end
    it "shuffles the ingredient array" do
      brownie.mix!
      expect(brownie.ingredients).not_to eql(brownie.ingredients.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      brownie.eat(30)
      expect(brownie.quantity).to eq(20)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { brownie.eat(60) }.to raise_error(RuntimeError)
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Evelyn")
      expect(brownie.serve).to include("Evelyn")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      allow(chef).to receive(:bake).with(brownie)
      brownie.make_more
    end
  end
end
