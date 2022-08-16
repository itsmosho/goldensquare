require 'make_snippet'



RSpec.describe 'make_snippet method' do
    context "given an empty string" do
        it "returns an empty string" do
        result = make_snippet("")
        expect(result).to eq ""
        
        end
    end

    context "given a string of four words" do
        it "returns that string" do
            result = make_snippet("Hello world my name")
            expect(result).to eq "Hello world my name"
        end
    end

    context "given a string of five words" do
        it "returns that string" do
            result = make_snippet("Hello world my name is")
            expect(result).to eq "Hello world my name is"
        end
    end

    context "given a string of six words" do
        it "returns the first five with a ..." do
            result = make_snippet("Hello world my name is Moses")
            expect(result).to eq "Hello world my name is..."
        end
    end



end


    #it 'returns an empty string '
    #it 'takes a string and returns the first five words of a string' do
        # when i enter "Hello world my name is Moses" as the argument it should put "Hello world my name is"
    #    expect make_snippet("Hello world my name is Moses").to eq("Hello world my name is")
    #end
#end
