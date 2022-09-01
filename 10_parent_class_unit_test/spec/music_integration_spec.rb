require "music_library"
require "track"

RSpec.describe "integration" do
    context "after adding multiple tracks" do
        it "returns the list of tracks" do
            music_library = MusicLibrary.new
            track1 = Track.new("Hello", "Adele")
            track2 = Track.new("Valerie", "Amy Winehouse")
            music_library.add(track1)
            music_library.add(track2)
            expect(music_library.all).to eq [track1, track2]
        end
    end

    context "after adding mulitple tracks" do
        it "returns the list of tracks that match the keyword in either title or artist" do
            music_library = MusicLibrary.new
            track1 = Track.new("Hello", "Adele")
            track2 = Track.new("title", "artist 1")
            track3 = Track.new("title", "artist 2")
            music_library.add(track1)
            music_library.add(track2)
            music_library.add(track3)
            expect(music_library.search("title")).to eq [track2, track3]
        end
    end

    context "after adding mulitple tracks" do
        it "returns and empty array if the list of tracks don't match the keyword" do
            music_library = MusicLibrary.new
            track1 = Track.new("Hello", "Adele")
            track2 = Track.new("title", "artist 1")
            track3 = Track.new("title", "artist 2")
            music_library.add(track1)
            music_library.add(track2)
            music_library.add(track3)
            expect(music_library.search("TRACK")).to eq []
        end
    end



end