class TaskTracker 
    def initialize
      @todo_list = []
    end

    def add(task)
      fail "no task added" if task.empty?
      @todo_list << task
    end

    def see
      list = @todo_list.join(", ")
      "Your todo list is: #{list}"
    end

    def completed(task)
        list = @todo_list.join(", ")
        if list(task)
            list.delete!(task)
        end
    end
end