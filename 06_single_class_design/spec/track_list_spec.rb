require "track_list"

RSpec.describe Tracklist do
    it "constructs" do
        tracklist = Tracklist.new
        expect(tracklist.list).to eq []
    end

    it "adds track to the tracklist" do
        tracklist = Tracklist.new
        tracklist.add("Changes")
        expect(tracklist.list).to eq ["Changes"]
    end

    it "can add multiple tracks to the tracklist" do
        tracklist = Tracklist.new
        tracklist.add ("Changes")
        tracklist.add ("Peru")
        expect(tracklist.list).to eq ["Changes", "Peru"]
    end
    
end