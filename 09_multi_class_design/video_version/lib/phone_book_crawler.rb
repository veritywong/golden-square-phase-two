class PhoneBookCrawler
    def initialize(diary) #diary is an instance of Diary
        @diary = diary
    end

    def extract_numbers
        # returns a list of strings represetning phone numberes
        # gathered across all diary entries
        return @diary.entries.flat_map do |entry|
            extract_numbers_from_entry(entry)
        end.uniq
    end

    private

    def extract_numbers_from_entry(entry)
        return entry.contents.scan(/07[0-9]{9}/)
    end

end