require "diary" 
require "diary_entry"

RSpec.describe "integration" do
    context "after adding some entries" do
        it "gives a list of the entries" do
            diary =  Diary.new
            hello =  DiaryEntry.new("Hello", "Hello world")
            name =  DiaryEntry.new("Name", "My name is Moses")
            diary.add(hello)
            diary.add(name)
            expect(diary.all).to eq [hello, name]
        end
    end

    context "after adding some entries" do
        it "gives the word count of the whole diary" do
            diary =  Diary.new
            hello =  DiaryEntry.new("Hello", "Hello world")
            name =  DiaryEntry.new("Name", "My name is Moses")
            diary.add(hello)
            diary.add(name)
            expect(diary.count_words).to eq 6
        end
    end

    context "after adding some entries" do
        it "gives the reading time of the whole diary when wpm is given" do
            diary =  Diary.new
            hello =  DiaryEntry.new("Hello", "Hello world")
            name =  DiaryEntry.new("Name", "My name is Moses")
            diary.add(hello)
            diary.add(name)
            result = diary.reading_time(3)
            expect(result).to eq 2
        end
    end

    context "after adding some entries" do
        it "gives the word count of the whole diary" do
            diary =  Diary.new
            hello =  DiaryEntry.new("Hello", "Hello world")
            name =  DiaryEntry.new("Name", "My name is Moses")
            diary.add(hello)
            diary.add(name)
            expect(diary.count_words).to eq 6
        end
    end
    it "calcutales the reading time for all entries where it fits exactly" do
        diary = Diary.new
        hello =  DiaryEntry.new("Hello", "Hello world")
        name =  DiaryEntry.new("Name", "My name is Moses")
        diary.add(hello)
        diary.add(name)
        expect(diary.reading_time(2)).to eq 3
    end

    it "calcutales the reading time for all entries where it doesn't fit exactly" do
        diary = Diary.new
        hello =  DiaryEntry.new("Hello", "Hello world my")
        name =  DiaryEntry.new("Name", "My name is Moses")
        diary.add(hello)
        diary.add(name)
        expect(diary.reading_time(2)).to eq 3
    end

    it "fails where WPM is 0" do
        diary = Diary.new
        hello =  DiaryEntry.new("Hello", "Hello world my")
        diary.add(hello)
        expect{diary.reading_time(0)}.to raise_error("WPM must be positive.")
    end

    describe "best reading time entry behavior" do
        it "fails where WPM is 0" do
            diary = Diary.new
            hello = DiaryEntry.new("Hello", "Hello World")
            diary.add(hello)
            expect{diary.find_best_entry_for_reading_time(0, 1)}.to raise_error("WPM must be positive.")

        end
    
        context "where we have one entry and it is readable in the time" do
            it "returns that entry" do
                diary = Diary.new
                hello = DiaryEntry.new("Hello", "Hello World")
                diary.add(hello)
                result = diary.find_best_entry_for_reading_time(2, 1)
                expect(result).to eq hello
            end
        end

        context "where we just have one entry and it is unreadable in the time" do
            it "returns nil" do
                diary = Diary.new
                hello = DiaryEntry.new("Hello", "Hello World my")
                diary.add(hello)
                result = diary.find_best_entry_for_reading_time(2, 1)
                expect(result).to eq nil
            end
        end

        context "where we have mulitple entries" do
            it "returns the longest entry user could read in that time" do
                diary = Diary.new
                hello = DiaryEntry.new("Hello", "Hello World")
                world = DiaryEntry.new("World", "My name is Moses")
                diary.add(hello)
                diary.add(world)
                result = diary.find_best_entry_for_reading_time(2, 2)
                expect(result).to eq world
            end
        end
    end
end