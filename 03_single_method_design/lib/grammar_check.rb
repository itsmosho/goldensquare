def grammar_check(str)
    first_letter_upcase =  (str.chr == str.chr.upcase)
    last_character_punctuation = (str[-1] == ".") || (str[-1] == "!") || (str[-1] == "?")
    if  first_letter_upcase && last_character_punctuation
      return true
    else
      return false
    end
    #str.chr == str.chr.upcase && (str[-1] == ".") || (str[-1] == "!") || (str[-1] == "?") ? true : false
end