Grammar Method Design Recipe

1. Describe the Problem
Put or write the user story here. Add any clarifying notes you might have.

    As a user
    So that I can improve my grammar
    I want to verify that a text starts with a capital letter and ends with a suitable sentence-ending punctuation mark.

2. Design the Method Signature
Include the name of the method, its parameters, return value, and side effects.

# grammer_checker(text) checks if the sentence starts with a capital and ends with a suitable end punctuation.
is_correct = check_grammar(text)

# * text: a string of words in it
# * is_correct: a boolean depending on whether it checks out

# The method doesn't print anything or have any other side-effects


3. Create Examples as Tests
Make a list of examples of what the method will take and return.

check_grammar("") => fail "Not a sentence."
check_grammar("Hello there.") => true
check_grammar("Hello there,") => false
check_grammar("Hello there, how are you?") => true
check_grammar("hello there, how are you?") => false


4. Implement the Behaviour
After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.