require 'diary'
require 'diary_entry'
require 'diary_reader'
require 'phone_book_crawler'

RSpec.describe "diary integration" do
    it "shows entries form diary" do
        diary = Diary.new
        entry_1 = DiaryEntry.new("my title 1", "entry 1")
        entry_2 = DiaryEntry.new("my title 2", "entry 2")
        diary.add(entry_1)
        diary.add(entry_2)
        expect(diary.entries).to eq [entry_1, entry_2]
    end

    it "displays readable entry" do 
        diary = Diary.new
        reader = DiaryReader.new(2, diary)
        entry_1 = DiaryEntry.new("title1", "one")
        entry_2 = DiaryEntry.new("title2", "one two")
        entry_3 = DiaryEntry.new("title3", "one two three")
        entry_4 = DiaryEntry.new("title4", "one two three four")
        entry_5 = DiaryEntry.new("title5", "one two three four five")
        diary.add(entry_1)
        diary.add(entry_2)
        diary.add(entry_3)
        diary.add(entry_4)
        diary.add(entry_5)
        expect(reader.find_most_readable_in_time(2)).to eq entry_4
    end

    it "displays readable chunk that is not exact" do
        diary = Diary.new
        reader = DiaryReader.new(2, diary)
        entry_1 = DiaryEntry.new("title1", "one")
        entry_2 = DiaryEntry.new("title2", "one two")
        entry_3 = DiaryEntry.new("title3", "one two three")
        entry_4 = DiaryEntry.new("title4", "one two three four five")
        diary.add(entry_1)
        diary.add(entry_2)
        diary.add(entry_3)
        diary.add(entry_4)
        expect(reader.find_most_readable_in_time(2)).to eq entry_3
    end

    it "returns nil when nothing readable" do
        diary = Diary.new
        reader = DiaryReader.new(2, diary)
        entry_1 = DiaryEntry.new("title4", "one two three four five")
        diary.add(entry_1)
        expect(reader.find_most_readable_in_time(2)).to eq nil
    end

    it "returns nil with empty diary" do
        diary = Diary.new
        reader = DiaryReader.new(2, diary)
        expect(reader.find_most_readable_in_time(2)).to eq nil
    end

    it "fails when invalid WPM" do
        diary = Diary.new
        expect { 
            DiaryReader.new(0, diary) 
        }.to raise_error "WPM must be above 0."
    end

    it "returns phone numbers" do
        diary = Diary.new
        phone_book = PhoneBookCrawler.new(diary)
        diary.add(DiaryEntry.new("title1", "my friend 07800000000 is cool"))
        diary.add(DiaryEntry.new("title2", "my friends 07800000000, 07800000001, 07800000002, 07800000002 are cool"))
        expect(phone_book.extract_numbers).to eq [
            "07800000000",
            "07800000001",
            "07800000002"
        ]
    end

    it "doesn't extract invalid numbers" do
        diary = Diary.new
        phone_book = PhoneBookCrawler.new(diary)
        diary.add(DiaryEntry.new("title1", "my friend 17800000000 is cool"))
        diary.add(DiaryEntry.new("title2", "my friends 07800000"))
        expect(phone_book.extract_numbers).to eq []
    end
end