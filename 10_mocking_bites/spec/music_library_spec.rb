require "music_library"

RSpec.describe MusicLibrary do

    context "after adding multiple tracks" do
        it "returns the list of tracks" do
            music_library = MusicLibrary.new
            track1 = double(:fake_track, title: "title", artist: "artist")
            track2 = double(:fake_track, title: "title", artist: "artist")
            music_library.add(track1)
            music_library.add(track2)
            expect(music_library.all).to eq [track1, track2]
        end
    end

    
    context "after adding mulitple tracks" do
        it "returns the list of tracks that match the keyword in either tile or artist" do
            music_library = MusicLibrary.new
            track1 = double(:fake_track, title: "Hello", artist: "Adele")
            track2 = double(:fake_track, title: "title", artist: "artist 1")
            track3 = double(:fake_track, title: "title", artist: "artist 2")
            allow(track1).to receive(:matches?).with("title").and_return(false)
            allow(track2).to receive(:matches?).with("title").and_return(true)
            allow(track3).to receive(:matches?).with("title").and_return(true)
            music_library.add(track1)
            music_library.add(track2)
            music_library.add(track3)
            expect(music_library.search("title")).to eq [track2, track3]
        end
    end


    context "after adding mulitple tracks" do
        it "returns and empty array if the list of tracks don't match the keyword" do
            music_library = MusicLibrary.new
            track1 = double(:fake_track, title: "Hello", artist: "Adele")
            track2 = double(:fake_track, title: "title", artist: "artist 1")
            track3 = double(:fake_track, title: "title", artist: "artist 2")
            allow(track1).to receive(:matches?).with("track").and_return(false)
            allow(track2).to receive(:matches?).with("track").and_return(false)
            allow(track3).to receive(:matches?).with("track").and_return(false)
            music_library.add(track1)
            music_library.add(track2)
            music_library.add(track3)
            expect(music_library.search("track")).to eq []
        end
    end



end