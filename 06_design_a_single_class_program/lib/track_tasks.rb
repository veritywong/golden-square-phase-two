class TaskTracker 
    def initialize
      @todo_list = []
    end

    def add(task)
      fail "no task added" if task.empty?
      @todo_list << task
    end

    def completed(task)
        @todo_list.delete(task)
    end

    def see
      list = @todo_list.join(", ")
      "Your todo list is: #{list}"
    end

end