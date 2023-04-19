require 'todo'
require 'todo_list'

RSpec.describe "todo list and todo class integration" do
    describe "when no items added to list" do

    end

    describe "when items are added onto the list" do
        it "shows complete item" do
            todo = Todo.new("walk dog")
            list = TodoList.new
            todo.mark_done!
            list.add(todo)
            expect(list.complete).to eq todo
        end
    
        it "shows incomplete items" do
            todo_1 = Todo.new("walk dog")
            todo_2 = Todo.new("buy milk")
            list = TodoList.new
            todo_1.mark_done!
            list.add(todo_1)
            list.add(todo_2)
            expect(list.incomplete).to eq todo_2
        end

        it "marks everything as complete" do
            todo_1 = Todo.new("walk dog")
            todo_2 = Todo.new("buy milk")
            list = TodoList.new
            todo_1.mark_done!
            list.add(todo_1)
            list.add(todo_2)
            list.give_up!
            expect(list.incomplete).to eq [nil, nil]
        end
    end
end