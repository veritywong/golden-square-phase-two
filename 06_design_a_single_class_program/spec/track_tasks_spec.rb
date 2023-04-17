require 'track_tasks'

RSpec.describe "TaskTracker" do
    
    context "when given an empty text string, test fails" do
        it "fails" do
            task_todo = TaskTracker.new
            expect { task_todo.add("") }.to raise_error "no task added"
        end
    end

    context "when task is added it can be seen as a list" do
        it "shows todo list when one item added" do
            task_todo = TaskTracker.new
            task_todo.add("buy milk")
            expect(task_todo.see).to eq "Your todo list is: buy milk"
        end

        it "shows todo list when two items added" do
            task_todo = TaskTracker.new
            task_todo.add("buy milk")
            task_todo.add("walk dog")
            expect(task_todo.see).to eq "Your todo list is: buy milk, walk dog"
        end
    end
end

# # 1
# todo_task = TaskTracker.new
# todo_task.show_list # => []

# # 2
# todo_task = TaskTracker.new
# todo_task.add("buy milk")
# todo_task.show_list # => "Todo list: buy milk"

# # 3
# todo_task = TaskTracker.new
# todo_task.add("buy milk")
# todo_task.add("walk dog")
# todo_task.show_list # => "Todo list: buy milk, walk dog"