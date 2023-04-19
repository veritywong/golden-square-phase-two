require 'music_listening'

RSpec.describe MusicListening do

    context "when class is initialized" do
        it "empty array created" do
            tracks_listened_to = MusicListening.new
            expect(tracks_listened_to.list).to eq []
        end
    end

    context "when tracks are added" do
        it "one track is added into the array" do
            tracks_listened_to = MusicListening.new
            tracks_listened_to.add("Mercy, Mercy")
            expect(tracks_listened_to.list).to eq ["Mercy, Mercy"]
        end

        it "one track is added into the array" do
            tracks_listened_to = MusicListening.new
            tracks_listened_to.add("Mercy, Mercy")
            tracks_listened_to.add("Survivor")
            expect(tracks_listened_to.list).to eq ["Mercy, Mercy", "Survivor"]
        end
    end

    context "when no track is added" do
        it "fails" do
            tracks_listened_to = MusicListening.new
            expect { tracks_listened_to.add("") }.to raise_error "No track added."
        end
    end

end