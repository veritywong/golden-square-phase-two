class Diary
    def initialize
        @entries = []
    end

    def add(entry) # adds instances of DiaryEntries
        @entries << entry
    end

    def entries #shows instances of DiaryEntries/past entries
        @entries
    end

end