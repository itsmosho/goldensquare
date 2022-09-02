require "diary"


RSpec.describe Diary do
    it "constructs" do
        diary = Diary.new("Contents")
        expect(diary.read).to eq "Contents"
    end
end