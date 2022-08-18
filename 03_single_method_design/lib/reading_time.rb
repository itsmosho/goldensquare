def count_words(str)
    str.split(" ").count
end

def reading_time(str)
    word_count = count_words(str)
    time_to_read = word_count/200.to_f
    return time_to_read.ceil
end