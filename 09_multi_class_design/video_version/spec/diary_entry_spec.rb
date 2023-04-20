require 'diary_entry'

RSpec.describe DiaryEntry do
    it "construct" do
        diary_entry = DiaryEntry.new("my title 1", "entry 1")
        expect(diary_entry.title).to eq "my title 1"
        expect(diary_entry.contents).to eq "entry 1"
    end
end