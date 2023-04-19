class TodoList
    def initialize
        @todo_list = []
    end
  
    def add(todo) # todo is an instance of Todo
      # Returns nothing
      @todo_list << todo
    end
  
    def incomplete
        @todo_list.map do |todo|
            if !todo.done? 
              return todo
            end
        end
    end
  
    def complete
      # Returns all complete todos
        @todo_list.map do |todo|
            if todo.done? 
              return todo
            end
        end
    end
  
    def give_up!
      # Marks all todos as complete
      @todo_list.map do |todo|
        if !todo.done? 
          return todo.mark_done!
        end
    end
    end
  end