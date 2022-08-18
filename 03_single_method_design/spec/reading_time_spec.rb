require 'reading_time'

RSpec.describe "reading_time" do
    it "returns the estimated time taken to read string" do
        result = reading_time(" ") 
        expect(result).to eq 0
    end
      
    it "returns the estimated time taken to read string" do
        result = reading_time("One") 
        expect(result).to eq 1
    end
end
