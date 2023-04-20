require 'diary_entry'

RSpec.describe DiaryEntry do
    describe "# word count" do
        it "counts the words in an entry" do
            diary_entry = DiaryEntry.new("my_title", "one two three")
            expect(diary_entry.word_count).to eq 3
        end
    end
end