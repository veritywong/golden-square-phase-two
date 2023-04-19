require 'diary_entry'

RSpec.describe DiaryEntry do
    context "when new DiaryEntry created the title and contents is saved" do
        it "returns the title and contents" do
            new_entry = DiaryEntry.new("Monday", "sleepy " * 200)
            expect(new_entry.title).to eq "Monday"
            expect(new_entry.contents).to eq "sleepy " * 200
        end
    end

    context "counts words in contents" do
        it "returns the word count" do
            new_entry = DiaryEntry.new("Monday", "sleepy " * 200)
            expect(new_entry.count_words).to eq 200
        end
    end

    describe "reading time method" do
        it "fails" do
            new_entry = DiaryEntry.new("Monday", "so sleepy")
            expect { new_entry.reading_time(0) }.to raise_error "WPM must be positive."
        end
    
        it "returns the reading_time" do
            new_entry = DiaryEntry.new("Monday", "sleepy " * 400)
            expect(new_entry.reading_time(200)).to eq 2
        end
    end

    describe "reading chunk" do
        it "returns the chunk that can be read" do
            new_entry = DiaryEntry.new("Tuesday", "hungry " * 400)
            chunk = new_entry.reading_chunk(2, 1)
            expect(chunk).to eq "hungry hungry"
        end
    end



end