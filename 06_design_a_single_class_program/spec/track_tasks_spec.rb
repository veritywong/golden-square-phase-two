require 'track_tasks'

RSpec.describe "TaskTracker" do
    
    context "when given an empty text string fails" do
        it "fails" do
            task_todo = TaskTracker.new
            task_todo.add("")
            expect { task_todo.add("") }.to raise_error "no task added"
        end
    end
end