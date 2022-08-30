class Diary
    def initialize
      @diary = []
    end
  
    def add(entry) # entry is an instance of DiaryEntry
      # entry gets added to the @diary
      # Returns nothing
      @diary << entry
    end
  
    def list
      # Returns a list of entries in @diary
      @diary
    end
    
    def find_best_entries(wpm, minutes)
      #return a list of readable diary entries to read based on how much time(minutes) I have and my reading speed(wpm)
        max_words = wpm * minutes
        #arr = @numbers.split
        @diary.select do |entry|
            entry.count_words <= max_words
        end
    end

    def todo_list
            @todo_list    
    end

    def numbers
      # Returns a list of phone numbers as stringsnin all the diary entries
       @diary.map(&:extract_phone_numbers)
    end
end

