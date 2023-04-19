def get_most_common_letter(text)
     "a new empty hash called 'counter' is created"
    counter = Hash.new(0)
     "the text is turned into an array of letters and iterated over"
    text.chars.each do |char|
      counter[char] += 1
      # "each letter is added into the hash and counted #{counter[char] += 1}" 
    end
     "the counter now contains a hash of letter key and value as number of those letters #{counter}"
    p counter.to_a
     "the hash is turned into an array and put in ascending order #{counter.sort_by}"
     counter.to_a.sort_by { |k, v| v } [0] [0]
end

get_most_common_letter("the roof, the roof, the roof is on fire!")
