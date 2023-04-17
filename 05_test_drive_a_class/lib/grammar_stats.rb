class GrammarStats
  def initialize
    @correct_sentence_count = 0
    @incorrect_sentence_count = 0
  end

  def check(text)
    fail "Not a sentence." if text.empty?
    first_letter_is_uppercase = text[0] == text[0].upcase
    last_character_is_valid = [".", "!", "?"].include? text[-1]
    if first_letter_is_uppercase && last_character_is_valid
      @correct_sentence_count += 1
      return true
    else
      @incorrect_sentence_count += 1
      return false
    end
  end

  def percentage_good
    total = @correct_sentence_count + @incorrect_sentence_count
    percentage = @correct_sentence_count.to_f / total.to_f * 100
    return percentage
    # Returns as an integer the percentage of texts checked so far that passed
    # the check defined in the `check` method. The number 55 represents 55%.
  end
end
