class Diary
    def initialize
        @diary = []
    end

    def add(entry)
        @diary << entry
    end

    def show
        @diary
    end

    def chunk(wpm, time)
        readable_words = wpm * time
        readable_entries = []
        @diary.select do |entry|
            if entry.word_count <= readable_words
              readable_entries << entry
            end
        end
        return readable_entries.last
    end

    def contacts
        entries_with_numbers = []
        @diary.select do |title, entry|
            if entry =~ /\d/
                entries_with_numbers << entry
            end
        end
        entries_with_numbers
    end
end

# diary = Diary.new
# diary.add("Hannah, 07799988866")
# diary.add("Sally 07711122233")
# p diary.contacts
