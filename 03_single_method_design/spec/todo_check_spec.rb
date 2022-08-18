require 'todo_check'

RSpec.describe "todo_check" do
    context "when given an empty string" do
        it "returns false" do
            result = todo_check("")
            expect(result).to eq false
        end
    end

    context "when given a string not containing TODO" do
        it "returns false" do
            result = todo_check("Hello!")
            expect(result).to eq false
        end
    end

    context "when given a string that contains to do but not exact" do
        it "returns false" do
            result = todo_check("I have many things to do!")
            expect(result).to eq false
        end
    end

    context "when given a string that contains TODO" do
        it "returns true" do
            result = todo_check("This is my TODO list.")
            expect(result).to eq true
        end
    end

end