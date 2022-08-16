require 'report_length'

RSpec.describe "report_length" do
    context "when given an empty string" do
        it "returns 'This string was 0 characters long.'" do
            result = report_length("")
            expect(result).to eq("This string was 0 characters long.")
        end
    end

    context "when given a string of 3 characters" do
        it "returns 'This string was 3 characters long.'" do
            result = report_length("one")
            expect(result).to eq("This string was 3 characters long.")
        end
    end


    context "when given a string of 5 characters" do
        it "returns 'This string was 5 characters long.'" do
            result = report_length("three")
            expect(result).to eq("This string was 5 characters long.")
        end
    end


end


    