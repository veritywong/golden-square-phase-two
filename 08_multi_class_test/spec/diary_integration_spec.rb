require 'diary'
require 'diary_entry'

RSpec.describe "DiaryEntry and Diary integration" do
    context "returns entries" do
        it "returns first entry" do
            diary = Diary.new
            diary_entry = DiaryEntry.new("Monday", "sleepy")
            diary.add(diary_entry)
            expect(diary.all).to eq [diary_entry]
        end

        it "returns all entries" do
            diary = Diary.new
            diary_entry_1 = DiaryEntry.new("Monday", "sleepy")
            diary_entry_2 = DiaryEntry.new("Tuesday", "hungry")
            diary.add(diary_entry_1)
            diary.add(diary_entry_2)
            expect(diary.all).to eq [diary_entry_1, diary_entry_2]
        end

    end

    describe "word counting behaviour" do
        it "counts the words in all the diary entries" do
            diary = Diary.new
            diary_entry_1 = DiaryEntry.new("Monday", "sleepy")
            diary_entry_2 = DiaryEntry.new("Tuesday", "hungry")
            diary.add(diary_entry_1)
            diary.add(diary_entry_2)
            expect(diary.count_words).to eq 2
        end
    end

    describe "reading time behaviour" do

        it "fails" do
            new_entry = DiaryEntry.new("Monday", "so sleepy")
            expect { new_entry.reading_time(0) }.to raise_error "WPM must be positive."
        end
        
        it "returns reading time for all entries" do
            diary = Diary.new
            diary_entry_1 = DiaryEntry.new("Monday", "I'm so sleepy")
            diary_entry_2 = DiaryEntry.new("Tuesday", "Today I am hungry")
            diary.add(diary_entry_1)
            diary.add(diary_entry_2)
            expect(diary.reading_time(3)).to eq 3
        end
    end


    # context "when chunk has been read" do
    #     it "returns the next readable chunk" do
    #         diary = Diary.new
    #         diary_entry = DiaryEntry.new("Monday", "sleepy")
    #         next_entry = DiaryEntry.new("Tuesday", "hungry")
    #         diary.add(diary_entry)
    #         diary.add(next_entry)
    #         chunk = diary.reading_chunk(2, 1)
    #         expect(chunk).to eq "sleepy"
    #     end
    # end
end