class DiaryEntry
    def initialize(title, contents) # title, contents are strings
      @title = title
      @contents = contents
      @furthest_word_read = 0
    end
  
    def title
        if @title.length == 0
            fail "Please enter a valid string."
        else
            return @title
        end
    end
  
    def contents
        if @contents.length == 0
            fail "Please enter a valid string."
        else
            return @contents
        end
    end
  
    def count_words
      # Returns the number of words in the contents as an integer
      @word_count =  @contents.split(" ").count
      return @word_count
    end
    
  
    def reading_time(wpm) # wpm is an integer representing the number of words the
                          # user can read per minute
      # Returns an integer representing an estimate of the reading time in minutes
      # for the contents at the given wpm.
        
      @reading_time = (@word_count/wpm).ceil
      return @reading_time
      
    
    end
  
    def reading_chunk(wpm, minutes) 
      @arr = @contents.split(" ")
      @number_of_words = wpm * minutes  
      start_from = @furthest_word_read
      end_at = @furthest_word_read + @number_of_words
      
      chunk = @arr[start_from, end_at]
      @furthest_word_read = end_at
      if end_at >= count_words
        @furthest_word_read = 0
      else
        @furthest_word_read = end_at
      end
      return chunk.join(" ")
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


