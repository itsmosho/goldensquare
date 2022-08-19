class GrammarStats
    def initialize
      # ...
      @total_count = 0
      @success_count = 0
    end
  
    def check(text) 
        @total_count += 1
        first_letter_upcase =  (text.chr == text.chr.upcase)
        last_character_punctuation = (text[-1] == ".") || (text[-1] == "!") || (text[-1] == "?")
        if  first_letter_upcase && last_character_punctuation
          @success_count += 1
          return true
        else
          return false
        end
        
        # text is a string
      # Returns true or false depending on whether the text begins with a capital
      # letter and ends with a sentence-ending punctuation mark.
    end

    def percentage_good
     

      # Returns as an integer the percentage of texts checked so far that passed
      # the check defined in the `check` method. The number 55 represents 55%.
        pass_rate = @success_count / @total_count.to_f
        p "the success count is #{@success_count} and the total count is #{@total_count}"
        return (pass_rate * 100).ceil


      # %of texts checked so far! that passed  
      # texts checked that passed / total texts check = pass_check
      # return (pass_check * 100).to_i or .ceil
    end
  end

  def run_code
        grammarstats = GrammarStats.new
        grammarstats.check("Hello?")
        grammarstats.check("Hello")
        result = grammarstats.percentage_good
        puts result
  end
  #run_code