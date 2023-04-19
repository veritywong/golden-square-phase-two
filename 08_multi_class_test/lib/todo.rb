class Todo
    def initialize(task) # task is a string
      @task = task
      @list = Hash.new(false)
    end
  
    def task
      # Returns the task as a string
      @task
    end
  
    def mark_done!
      # Marks the todo as done
      # Returns nothing
      @list[task] = true
      

    end
  
    def done?
      # Returns true if the task is done
      # Otherwise, false
      @list[task]
    end
  end
  