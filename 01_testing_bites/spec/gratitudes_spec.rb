require "gratitudes"

RSpec.describe Gratitudes do
    it "returns 'Be grateful for: ' when no gratitudes are added" do
        gratitudes = Gratitudes.new
        expect(gratitudes.format).to eq("Be grateful for: ")
    end

    it "returns a gratitude statement when a gratitude is added" do
        gratitudes = Gratitudes.new
        gratitudes.add("life")
        expect(gratitudes.format).to eq("Be grateful for: life")
    end

    it "returns a list of gratitudes when more than one is added" do
        gratitudes = Gratitudes.new
        gratitudes.add("life")
        gratitudes.add("health")
        expect(gratitudes.format).to eq("Be grateful for: life, health")
    end
end