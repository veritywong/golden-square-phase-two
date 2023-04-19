class DiaryEntry
    def initialize(title, contents) 
        @title = title
        @contents = contents
        @words = @contents.split(" ")
    end
  
    def title
      @title
    end
  
    def contents
      @contents
    end
  
    def count_words
      @contents.split(" ").length
    end
  
    def reading_time(wpm) 
        fail "WPM must be positive." unless wpm.positive?
        (count_words.to_f / wpm.to_f).ceil
    end
  
    def reading_chunk(wpm, minutes) 
        fail "Reading speed must be above 0" unless wpm > 0
        readable_words = wpm * minutes
        @words[0,readable_words].join(" ")
        # start_from = @furthest_word_read
        # end_at = @furthest_word_read + readable_words
        # word_list = words[start_from, end_at]
        #   if end_at >= count_words
        #     @furthest_word_read = 0
        #   else 
        #     @furthest_word_read = end_at
        #   end
        # word_list.join(" ")
        # `wpm` is an integer representing the number
                                    # of words the user can read per minute
                                    # `minutes` is an integer representing the
                                    # number of minutes the user has to read
      # Returns a string with a chunk of the contents that the user could read
      # in the given number of minutes.
      # If called again, `reading_chunk` should return the next chunk, skipping
      # what has already been read, until the contents is fully read.
      # The next call after that it should restart from the beginning.
    end
  end