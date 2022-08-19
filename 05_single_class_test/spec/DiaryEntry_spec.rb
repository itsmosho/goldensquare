require "DiaryEntry"

RSpec.describe DiaryEntry do
        it "constructs" do
            diary_entry = DiaryEntry.new("my_title", "my_contents")
            expect(diary_entry.title).to eq "my_title"
            expect(diary_entry.contents).to eq "my_contents"
        end

        it "error outputted if title string is empty" do
            diary_entry = DiaryEntry.new("", "a")
            expect {diary_entry.title}.to raise_error "Please enter a valid string."
        end

        it "error outputted if contents string is empty" do
            diary_entry = DiaryEntry.new("a", "")
            expect {diary_entry.contents}.to raise_error "Please enter a valid string."
        end

        it "returns the number of words in a given string" do
            diary_entry = DiaryEntry.new("Title", "This is the contents")
            expect(diary_entry.count_words).to eq 4
        end

        it "returns a reading time based on a given words per minute - rounded up" do
            diary_entry = DiaryEntry.new("Title", "This is the contents")
            diary_entry.count_words
            expect(diary_entry.reading_time(1)).to eq 4
        end

        it "returns whole string if {@contents} is less than {@number_of_words}" do
            diary_entry = DiaryEntry.new("Title", "This is the contents")
            expect(diary_entry.reading_chunk(5,1)).to eq "This is the contents"
        end

        it "cuts off chunk if {@contents} is greater than {@number_of_words}" do
            diary_entry = DiaryEntry.new("Title", "This is the contents of this story")
            expect(diary_entry.reading_chunk(5,1)).to eq "This is the contents of"
        end

        it "Returns next chunk next time we are asked" do
            diary_entry = DiaryEntry.new("Title", "This is the contents of this")
            diary_entry.reading_chunk(3,1)
            expect(diary_entry.reading_chunk(3,1)).to eq "contents of this"
        end

        it "Restarts after reading whole contents" do
            diary_entry = DiaryEntry.new("Title", "This is the contents of this")
            diary_entry.reading_chunk(3,1)
            diary_entry.reading_chunk(4,1)
            expect(diary_entry.reading_chunk(3,1)).to eq "This is the"
        end

        it "Restarts if it finishes exactly on the end" do
            diary_entry = DiaryEntry.new("Title", "This is the contents of this")
            diary_entry.reading_chunk(3,1)
            diary_entry.reading_chunk(4,1)
            expect(diary_entry.reading_chunk(3,1)).to eq "This is the"
        end
    end
