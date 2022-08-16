def count_words(text)
    count = 0
    words = text.split(" ")
    words.each { |word| count += 1 }
    count
end