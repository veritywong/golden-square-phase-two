require 'todo'

RSpec.describe Todo do
    context "when todo instance created" do
        it "creates a task" do
            todo = Todo.new("walk dog")
            expect(todo.task).to eq "walk dog"
        end
    end

    describe "tasks that are done" do
        it "marks tasks as done" do
            task_1 = Todo.new("walk dog")
            task_1.mark_done!
            expect(task_1.done?).to eq true
        end

        it "marks not done tasks as false" do
            task_1 = Todo.new("walk dog")
            task_2 = Todo.new("buy milk")
            task_3 = Todo.new("buy milk")
            task_1.mark_done!
            task_3.mark_done!
            expect(task_2.done?).to eq false
            expect(task_3.done?).to eq true
        end
    end
end