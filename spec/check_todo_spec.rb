require 'check_todo'

RSpec.describe "check_todo method" do
    context "fails if nothing on the list." do
        it "fails" do
            expect {check_todo("")}.to raise_error "Nothing on the list."
        end
    end

    context "returns true if list includes 'TODO'" do
        it "returns true" do
            expect(check_todo("TODO buy milk")).to eq true
        end
        it "returns true" do
            expect(check_todo("TODO buy milk, TODO walk dog")).to eq true
        end

    end

    context "returns false if list doesn't include TODO" do
        it "returns false" do
            expect(check_todo("DONE buy milk")).to eq false
        end
    end
end

# check_todo("") fail "Nothing on the list."
# check_todo("TODO buy milk") => true
# check_todo("TODO buy milk, TODO walk dog") => true
# check_todo("DONE buy milk") => false