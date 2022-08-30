class DiaryEntry
    def initialize(title, contents)
      @title = title
      @contents = contents
    end
  
    def read
        @contents
    end

    def count_words
        @contents.split(" ").count
    end

    def extract_phone_numbers
       phone_number = @contents.tr("^0-9", '')
       phone_number
    end

end
  
