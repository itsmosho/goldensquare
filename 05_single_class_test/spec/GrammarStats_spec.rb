require 'GrammarStats'

RSpec.describe GrammarStats do
    it "returns false when string is empty" do
        grammarstats = GrammarStats.new
        result = grammarstats.check(" ")
        expect(result).to eq false
    end
      
    it "returns false when string does not start with uppercase character" do
        grammarstats = GrammarStats.new
        result = grammarstats.check("hello!")
        expect(result).to eq false
    end
      
    it "returns true when string starts with uppercase character and ends in question mark" do
        grammarstats = GrammarStats.new
        result = grammarstats.check("Hello?")
        expect(result).to eq true
    end

    it "returns 100% when full string meets criteria" do
        grammarstats = GrammarStats.new
        grammarstats.check("Hello?") 
        result = grammarstats.percentage_good
        expect(result).to eq 100
    end
    it "returns 50% when a second string is passed that doesn't meet criteria" do
        grammarstats = GrammarStats.new
        grammarstats.check("Hello") 
        grammarstats.check("Hello!") 
        result = grammarstats.percentage_good
        expect(result).to eq 50
    end

    it "returns 0% when a s string is passed that doesn't meet criteria" do
        grammarstats = GrammarStats.new
        grammarstats.check("Hello") 
        result = grammarstats.percentage_good
        expect(result).to eq 0
    end

end