require "diary_entry"

RSpec.describe DiaryEntry do
    it "reads a diary entry" do
        diary_entry = DiaryEntry.new("Hello", "Hello World")
        expect(diary_entry.read).to eq "Hello World"
    end

    it "takes the phone number from a diary entry" do
        diary_entry = DiaryEntry.new("Hello", "Hello number is 07950911238")
        expect(diary_entry.extract_phone_numbers).to eq "07950911238"
    end
end