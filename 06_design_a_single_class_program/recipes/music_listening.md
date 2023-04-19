Music Listening Class Design Recipe
1. Describe the Problem
Put or write the user story here. Add any clarifying notes you might have.

    As a user
    So that I can keep track of my music listening
    I want to add tracks I've listened to and see a list of them.

2. Design the Class Interface
Include the initializer and public methods with all parameters and return values.

class MusicListening

  def initialize
      #creates an empty array to store the song tracks in
  end

  def add(tracks)
    # adds tracks to the array
    # tracks is a string containing the song name
  end

  def list
    # shows the list of songs listened to
  end

end


3. Create Examples as Tests
Make a list of examples of how the class will behave in different situations.

# 1
tracks_listened_to = MusicListening.new
tracks_listened_to.list # => []

# 2
tracks_listened_to = MusicListening.new
tracks_listened_to.add("Mercy, Mercy")
tracks_listened_to.list # => ["Mercy, Mercy"]

# 3
tracks_listened_to = MusicListening.new
tracks_listened_to.add("Mercy, Mercy")
tracks_listened_to.add("Survivor")
tracks_listened_to.list # => ["Mercy, Mercy", "Survivor"]

# 4
tracks_listened_to = MusicListening.new
tracks_listened_to.add("") # it fails "No track added."



4. Implement the Behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.