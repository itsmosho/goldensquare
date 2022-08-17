require 'password_checker'

RSpec.describe PasswordChecker do
    context "When an empty string is entered" do
        it "fails and returns 'Invalid password, must be 8+ characters.'" do
            password_checker = PasswordChecker.new
            expect{password_checker.check("")}.to raise_error("Invalid password, must be 8+ characters.")
        end
    end

    context "When a string less than 8 characters is entered" do
        it "fails and returns 'Invalid password, must be 8+ characters.'" do
            password_checker = PasswordChecker.new
            expect{password_checker.check("one")}.to raise_error("Invalid password, must be 8+ characters.")
        end
    end

    it "returns true when string is more than 8 characters" do
            password_checker = PasswordChecker.new
            expect(password_checker.check("passwords")).to eq(true)
        
    end
end
