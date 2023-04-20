class DiaryEntry
    def initialize(title, entry)
        @title = title
        @entry = entry
    end

    def word_count
        @entry.split(" ").size
    end
end