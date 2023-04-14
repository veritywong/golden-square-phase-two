require 'check_grammar'

RSpec.describe 'check_grammar method' do

    context "it fails when no sentence given" do
        it "fails" do
            expect {check_grammar("")}.to raise_error "Not a sentence."
        end
    end


    
    context "it returns true with correct sentence grammar" do
        it "returns true" do
            result = check_grammar("Hello there.")
            expect(result).to eq true
        end

        it "returns true" do
            result = check_grammar("Hello there?")
            expect(result).to eq true
        end

        it "returns true" do
            result = check_grammar("Hello there!")
            expect(result).to eq true
        end
    end

    context "it returns false with incorrect sentence grammar" do
        it "returns false" do
            result = check_grammar("Hello there,")
            expect(result).to eq false
        end

        it "returns true" do
            result = check_grammar("hello there!")
            expect(result).to eq false
        end
    end

end

# check_grammar("") => fail "Not a sentence."
# check_grammar("Hello there.") => true
# check_grammar("Hello there,") => false
# check_grammar("Hello there, how are you?") => true
# check_grammar("hello there, how are you?") => false