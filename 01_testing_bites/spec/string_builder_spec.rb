require "string_builder"

RSpec.describe StringBuilder do
    it "initially returns an empty string as output" do
        string_builder = StringBuilder.new
        expect(string_builder.output).to eq("")
    end

    it "returns a string as output when a string is added" do
        string_builder = StringBuilder.new
        string_builder.add("Hello")
        expect(string_builder.output).to eq("Hello")
    end

    it "returns string size when a string is added and size is called" do
        string_builder = StringBuilder.new
        string_builder.add("Hello")
        expect(string_builder.size).to eq(5)
    end

    it "returns a longer string when multiple strings are added" do
        string_builder = StringBuilder.new
        string_builder.add("Hello ")
        string_builder.add("world!")
        expect(string_builder.output).to eq("Hello world!")
    end

    it "returns a the size oflonger string when multiple strings are added and size is called" do
        string_builder = StringBuilder.new
        string_builder.add("Hello ")
        string_builder.add("world!")
        expect(string_builder.size).to eq(12)
    end
end