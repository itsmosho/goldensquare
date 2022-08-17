require 'present'

RSpec.describe Present do
    context "When no contents in present" do
        it "Fails saying 'No contents have been wrapped.'" do
            present = Present.new
            expect{present.unwrap}.to raise_error("No contents have been wrapped.")
        end
    end

    context "When present has already been wrapped" do
        it "Fails saying 'A contents has already been wrapped.'" do
            present = Present.new
            present.wrap("book")
            expect{present.wrap("toy")}.to raise_error("A contents has already been wrapped.")
        end
    end
end

