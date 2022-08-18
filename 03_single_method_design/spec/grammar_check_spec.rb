require 'grammar_check'

RSpec.describe "grammar_check" do
    it "returns false when string is empty" do
        result = grammar_check(" ")
        expect(result).to eq false
    end
      
    it "returns false when string does not start with uppercase character" do
        result = grammar_check("hello!")
        expect(result).to eq false
    end
      
    it "returns true when string starts with uppercase character and ends in question mark" do
        result = grammar_check("Hello?")
        expect(result).to eq true
    end
end