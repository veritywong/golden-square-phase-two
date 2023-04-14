Check TODO Method Design Recipe

1. Describe the Problem
Put or write the user story here. Add any clarifying notes you might have.

    As a user
    So that I can keep track of my tasks
    I want to check if a text includes the string #TODO

2. Design the Method Signature
Include the name of the method, its parameters, return value, and side effects.

todos = check_todo(text)
# * text: string of words
# * todos: boolean which is true if there are todos (e.g. "TODO buy milk")


# The method doesn't print anything or have any other side-effects

3. Create Examples as Tests
Make a list of examples of what the method will take and return.

check_todo("") fail "Nothing on the list."
check_todo("TODO buy milk") => true
check_todo("TODO buy milk, TODO walk dog") =>
check_todo("DONE buy milk") => false

4. Implement the Behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.