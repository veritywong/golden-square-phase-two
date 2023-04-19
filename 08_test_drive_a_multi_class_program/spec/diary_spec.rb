require 'diary'

RSpec.describe Diary do
    context "creates an empty list" do
        it "creates a list" do
            new_entry = Diary.new
            expect(new_entry.all).to eq []
        end
    end

    context "has a word count of 0" do
        it "returns 0" do
            new_entry = Diary.new
            expect(new_entry.count_words).to eq 0
        end
    end
end