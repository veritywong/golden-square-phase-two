require 'diary_entry'

RSpec.describe DiaryEntry do
    it "constructs" do
        diary_entry = DiaryEntry.new("my_title", "my_contents")
        expect(diary_entry.title).to eq "my_title"
        expect(diary_entry.contents).to eq "my_contents"
    end

    describe "#count_words" do # hash means instance method
        it "returns the number of words in the contents" do
            diary_entry = DiaryEntry.new("my_title", "some contents here")
            expect(diary_entry.count_words).to eq 3
        end

        it "returns 0 when contents is empty" do
            diary_entry = DiaryEntry.new("my_title", "")
            expect(diary_entry.count_words).to eq 0
        end
    end

    describe "#reading_time" do
        context "given a wpm of some sensible number (200)" do
            it "returns the ceiling of the number of minutes it takes to read the content" do
                diary_entry = DiaryEntry.new("my_title", "words " * 300 )
                expect(diary_entry.reading_time(200)).to eq 2
            end
        end

        context "given a wpm of 0" do
            it "fails" do
                diary_entry = DiaryEntry.new("my_title", "one two three")
                expect { diary_entry.reading_time(0) }.to raise_error "Reading speed must be above 0"
            end
        end
    end
# `wpm` is an integer representing the number
                                    # of words the user can read per minute
                                    # `minutes` is an integer representing the
                                    # number of minutes the user has to read
      # Returns a string with a chunk of the contents that the user could read
      # in the given number of minutes.
      # If called again, `reading_chunk` should return the next chunk, skipping
      # what has already been read, until the contents is fully read.
      # The next call after that it should restart from the beginning.
    describe "#reading_chunk" do

        context "given a wpm of 0" do
            it "fails" do
                diary_entry = DiaryEntry.new("my_title", "one two three")
                expect { diary_entry.reading_chunk(0, 5) }.to raise_error "Reading speed must be above 0"
            end
        end

        it "returns all the content when enough time" do
            diary_entry = DiaryEntry.new("my_title", "one two three")
            chunk = diary_entry.reading_chunk(200, 1)
            expect(chunk).to eq "one two three"
        end

        it "returns content that can be read in the given time" do
            diary_entry = DiaryEntry.new("my_title", "one two three")
            chunk = diary_entry.reading_chunk(2, 1)
            expect(chunk).to eq "one two"
        end

        it "returns the next chunk, next time we are asked" do
            diary_entry = DiaryEntry.new("my_title", "one two three")
            diary_entry.reading_chunk(2, 1)
            chunk = diary_entry.reading_chunk(2, 1)
            expect(chunk).to eq "three"
        end

        it "starts the contents again if all has been read" do
            diary_entry = DiaryEntry.new("my_title", "one two three")
            diary_entry.reading_chunk(2, 1)
            diary_entry.reading_chunk(2, 1)
            chunk = diary_entry.reading_chunk(2, 1)
            expect(chunk).to eq "one two"
        end

        it "restarts if it finishes exactly on th end" do
            diary_entry = DiaryEntry.new("my_title", "one two three four")
            diary_entry.reading_chunk(2, 1)
            diary_entry.reading_chunk(2, 1)
            chunk = diary_entry.reading_chunk(2, 1)
            expect(chunk).to eq "one two"
        end
    end

end