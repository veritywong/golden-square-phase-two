Track Tasks Class Design Recipe
1. Describe the Problem
Put or write the user story here. Add any clarifying notes you might have.

    As a user
    So that I can keep track of my tasks
    I want a program that I can add todo tasks to and see a list of them.

2. Design the Class Interface
Include the initializer and public methods with all parameters and return values.

```ruby
class TaskTracker 
    def initialize
        # initialize and empty array to sort to do list inputs
    end

    def add(text)
      # text is a string of a todo task
    end

    def see
      # returns the items on the todo list
    end
end
``` 

3. Create Examples as Tests
Make a list of examples of how the class will behave in different situations.

# 1
todo_task = TaskTracker.new
todo_task.add("")
todo_task.show_list # fail

# 2
todo_task = TaskTracker.new
todo_task.add("buy milk")
todo_task.show_list # => "Todo list: buy milk"

# 3
todo_task = TaskTracker.new
todo_task.add("buy milk")
todo_task.add("walk dog")
todo_task.show_list # => "Todo list: buy milk, walk dog"


4. Implement the Behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.