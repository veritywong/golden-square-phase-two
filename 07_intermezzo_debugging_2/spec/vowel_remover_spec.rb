require 'vowel_remover'

RSpec.describe "remove_vowels method" do
  it "removes a vowel from a simple string" do
    remover = VowelRemover.new("ab")
    result_no_vowels = remover.remove_vowels
    expect(result_no_vowels).to eq "b"
  end

  it "removes vowels from a complex string" do
    remover = VowelRemover.new("We will remove the vowels from this sentence.")
    result_no_vowels = remover.remove_vowels
    expect(result_no_vowels).to eq "W wll rmv th vwls frm ths sntnc."
  end

  it "returns an empty string when only vowels" do
    remover = VowelRemover.new("aeiou")
    result_no_vowels = remover.remove_vowels
    expect(result_no_vowels).to eq ""
  end

  it "removes vowels from a complex string" do
    remover = VowelRemover.new("As we move alot.")
    result_no_vowels = remover.remove_vowels
    expect(result_no_vowels).to eq "s w mv lt."
  end

end