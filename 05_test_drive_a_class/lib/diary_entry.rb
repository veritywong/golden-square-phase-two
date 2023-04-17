class DiaryEntry
    def initialize(title, contents)
      @title = title
      @contents = contents
      @furthest_word_read = 0
    end
  
    def title
      # Returns the title as a string
      @title
    end
  
    def contents
      # Returns the contents as a string
      @contents
    end
  
    def count_words
      # Returns the number of words in the contents as an integer
      @contents.split.length

    end
  
    def reading_time(wpm)
      fail "Reading speed must be above 0" unless wpm > 0
      (count_words / wpm.to_f).ceil
    end
  
    def reading_chunk(wpm, minutes)
      fail "Reading speed must be above 0" unless wpm > 0
      readable_words = wpm * minutes
      start_from = @furthest_word_read
      end_at = @furthest_word_read + readable_words
      word_list = words[start_from, end_at]
        if end_at >= count_words
          @furthest_word_read = 0
        else 
          @furthest_word_read = end_at
        end
      word_list.join(" ")
    end

    private
    def words
      @contents.split
    end

  end