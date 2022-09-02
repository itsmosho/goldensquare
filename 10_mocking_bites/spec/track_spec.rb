require "track"

RSpec.describe Track do
    it "returns true if title or artist match the keyword" do
        track = Track.new("Hello", "Adele")
        expect(track.matches?("Adele")).to eq true
    end


    it "returns false if title or artist don't match the keyword" do
        track = Track.new("Hello", "artist")
        expect(track.matches?("Adele")).to eq false
    end

    it "returns false if track fields are empty" do
        track = Track.new("", "")
        expect(track.matches?("Adele")).to eq false
    end

end

