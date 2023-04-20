#  Diary Multi-Class Planned Design Recipe

## 1. Describe the Problem

    As a user
    So that I can record my experiences
    I want to keep a regular diary

    As a user
    So that I can reflect on my experiences
    I want to read my past diary entries

    As a user
    So that I can reflect on my experiences in my busy day
    I want to select diary entries to read based on how much time I have and my reading speed

    As a user
    So that I can keep track of my tasks
    I want to keep a todo list along with my diary

    As a user
    So that I can keep track of my contacts
    I want to see a list of all of the mobile phone numbers in all my diary entries

## 2. Design the Class System

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_



```ruby
class Diary

    def add # adds instances of DiaryEntries
    end

    def entries #shows instances of DiaryEntries/past entries
    end

end

class DiaryEntries
    def initialize(titile, entry) # entry is a string of a diary entry
    end

    def title
    # returns title as a string
    end

    def contents
    # returns contents as a string
    end
end

class PhoneBookCrawler
    def initializes(diary) #diary is an instance of Diary
    end

    def extract_numbers
        # returns a list of strings represetning phone numberes
        # gathered across all diary entries
    end
end

class DiaryReader

    def initialize(wpm, diary)
         # diary is an instance of Diary class
         # wpm = how may wpm a reader can read per minute
    end

    def find_most_readable_in_time(time)
        # returns an isntance of DiaryEntry, corresponding to the entry with
        # the longest contents that is still readable within the time, base on
        # the wpm specified earlier
    end
end
 
class TaskList
    def add # adds instaces of Todo tasks
    end

    def all
        # returns a list of tasks
    end
end

class Task
    def initialize(title) #title is a string
    end

    def title
        # returns the title as a string
    end
end

```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

``` ruby
    # 1 

        # diary = Diary.new
        # entry_1 = DiaryEntry.new("my title 1", "entry 1")
        # entry_2 = DiaryEntry.new("my title 2", "entry 2")
        # diary.add(entry_1)
        # diary.add(entry_2)
        # expect(diary.show).to eq [entry_1, entry_2]

    # 2 exactly readable in time

        # diary = Diary.new
        # reader = DiaryReader.new(2, diary)
        # entry_1 = DiaryEntry.new("title1", "one")
        # entry_2 = DiaryEntry.new("title2", "one two")
        # entry_3 = DiaryEntry.new("title3", "one two three")
        # entry_4 = DiaryEntry.new("title4", "one two three four")
        # entry_5 = DiaryEntry.new("title5", "one two three four five")
        # diary.add(entry_1)
        # diary.add(entry_2)
        # diary.add(entry_3)
        # diary.add(entry_4)
        # diary.add(entry_5)
        # expect(reader.find_most_readable_in_time(2)).to eq entry_4

     # 3 readable in time but not exact

        # diary = Diary.new
        # reader = DiaryReader.new(2, diary)
        # entry_1 = DiaryEntry.new("title1", "one")
        # entry_2 = DiaryEntry.new("title2", "one two")
        # entry_3 = DiaryEntry.new("title3", "one two three")
        # entry_4 = DiaryEntry.new("title4", "one two three four five")
        # diary.add(entry_1)
        # diary.add(entry_2)
        # diary.add(entry_3)
        # diary.add(entry_4)
        # expect(reader.find_most_readable_in_time(2)).to eq entry_3

    # 4 nothing readable

        # diary = Diary.new
        # reader = DiaryReader.new(2, diary)
        # entry_1 = DiaryEntry.new("title4", "one two three four five")
        # diary.add(entry_1)
        # expect(reader.find_most_readable_in_time(2)).to eq nil

    # 5 nothing at all present

        # diary = Diary.new
        # reader = DiaryReader.new(2, diary)
        # expect(reader.find_most_readable_in_time(2)).to eq nil

     # 6 WPM invalid

        # diary = Diary.new
        # reader = DiaryReader.new(0, diary) # should fail "WPM must be above 0

    # 7 tasks created and added into list
        task_list = TaskList.new
        task_1 = Task.new("walk the dog")
        task_2 = Task.new("walk the cat")
        task_list.add(task_1)
        task_list.add(task_2)
        expect(task_list).to eq [task_1, task_2]

    # 8 find numbers from diary entries

        diary = Diary.new
        phone_book = PhoneNumberCrawler.new(diary)
        diary.add(DiaryEntry.new("title1", "my friend 07800000000 is cool))
        diary.add(DiaryEntry.new("title2", "my friends 07800000000, 07800000001, 07800000002, 07800000002 are cool))
        expect(phone_book.extract_numbers).to eq [
            "07800000000",
            "07800000001",
            "07800000002"
        ]
        

```


## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby

```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._
