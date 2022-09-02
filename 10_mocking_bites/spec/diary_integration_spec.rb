require "secret_diary"
require "diary"

RSpec.describe "integration" do
    context "initially" do
        it "raises error when trying to read" do
        diary = Diary.new("SECRET CONTENTS")
        secret_diary = SecretDiary.new(diary)
        expect{secret_diary.read}.to raise_error "Go away!"
        end
    end

    context "when unlocked " do
        it "reads the contents" do
            diary = Diary.new("SECRET CONTENTS")
            secret_diary = SecretDiary.new(diary)
            secret_diary.unlock
            expect(secret_diary.read).to eq "SECRET CONTENTS"
        end
    end

    context "when unlocked " do
        it "can be locked and contents not read" do
            diary = Diary.new("SECRET CONTENTS")
            secret_diary = SecretDiary.new(diary)
            secret_diary.unlock
            secret_diary.lock
            expect{secret_diary.read}.to raise_error "Go away!"
        end
    end



end


