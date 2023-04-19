class MusicListening
    def initialize
        @list = []
    end

    def list
        @list
    end

    def add(track)
        fail "No track added." if track.empty?
        @list << track
    end

end