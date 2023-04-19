require 'make_snippet'

RSpec.describe 'make_snippet method' do

    it "returns a string of up to 5 words" do
        expect(make_snippet("hello how are you?")).to eq "hello how are you?"
    end

    it "given string larger than 5 words returns first 5 words followed by ..." do
        expect(make_snippet("hello how are you doing on this day?")).to eq "hello how are you doing..."
    end

end