require 'count_words'

RSpec.describe "count words method" do

    it "returns 0 if given an empty string" do
        expect(count_words("")).to eq 0
    end

    it "returns the number of words given a string of text" do
        expect(count_words("hi there friend")).to eq 3
    end

    it "returns the number of words given a string of text" do
        expect(count_words("hi there-friend")).to eq 2
    end

end