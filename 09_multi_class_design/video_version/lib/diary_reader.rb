class DiaryReader

    def initialize(wpm, diary)
         fail "WPM must be above 0." unless wpm.positive?
         @wpm = wpm
         @diary = diary
    end

    def find_most_readable_in_time(time)
        return readable_entries(time).max_by do |entry|
            count_words(entry)
        end
        # returns an isntance of DiaryEntry, corresponding to the entry with
        # the longest contents that is still readable within the time, base on
        # the wpm specified earlier
    end

    private

    def readable_entries(time)
        readable_entries = @diary.entries.reject do |entry|
            calculate_reading_time(entry) > time
        end
    end

    def calculate_reading_time(entry)
        return (count_words(entry) / @wpm.to_f).ceil
    end

    def count_words(entry)
        return entry.contents.split(" ").length
    end
end