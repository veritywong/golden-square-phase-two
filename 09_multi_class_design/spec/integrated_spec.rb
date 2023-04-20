require 'diary'
require 'diary_entry'

RSpec.describe "integrated diary and todo lists" do
    describe "diary entry saving" do
        it "returns diary entires" do
            diary = Diary.new
            entry_1 = DiaryEntry.new("my title 1", "entry 1")
            entry_2 = DiaryEntry.new("my title 2", "entry 2")
            diary.add(entry_1)
            diary.add(entry_2)
            expect(diary.show).to eq [entry_1, entry_2]
        end
    end

    describe "readable chunk" do
        it "returns a readable entry given a certain amount of time" do
            diary = Diary.new
            entry_1 = DiaryEntry.new("my title 1", "entry one")
            entry_2 = DiaryEntry.new("my title 2", "entry one two three")
            diary.add(entry_1)
            diary.add(entry_2)
            diary.chunk(2, 2)
            expect(diary.chunk(2, 2)).to eq entry_2
        end
    end

    describe "contacts with numbers list" do
        it "shows list of contacts with their numbers" do
            diary = Diary.new
            entry_1 = DiaryEntry.new("my title 1", "Hannah, 07799988866")
            entry_2 = DiaryEntry.new("my title 2", "Sally 07711122233")
            entry_3 = DiaryEntry.new("my title 3", "entry one")
            diary.add(entry_1)
            diary.add(entry_2)
            expect(diary.contacts).to eq [entry_1, entry_2]
        end
    end
end



