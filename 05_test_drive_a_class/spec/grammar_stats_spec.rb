require "grammar_stats"

RSpec.describe GrammarStats do
  context "fails if given no text" do
    it "fails" do
      grammar_to_check = GrammarStats.new("")
      expect { grammar_to_check.check("") }.to raise_error "Not a sentence."
    end
  end

  context "it checks whether the text has correct grammar" do
    # text is a string
    # Returns true or false depending on whether the text begins with a capital
    # letter and ends with a sentence-ending punctuation mark.
    it "returns true if text begins with a capital and ends with correct punctuation mark" do
      grammar_to_check = GrammarStats.new("Hello there!")
      result = grammar_to_check.check("Hello there!")
      expect(result).to eq true
    end

    it "returns false if text begins with a capital and ends with wrong punctuation mark" do
      grammar_to_check = GrammarStats.new("Hello there!")
      result = grammar_to_check.check("Hello there,")
      expect(result).to eq false
    end
  end
  context "it calculates the percentage of text so far that pass" do
    it "returns 100% if 100% of the text is correct" do
      grammar_to_check = GrammarStats.new("Hello there!")
      grammar_to_check.check("Hello there!")
      expect(grammar_to_check.percentage_good).to eq 100
    end
  end
end
