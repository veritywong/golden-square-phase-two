class TaskTracker 
    def initialize
      @todo_list = []
    end

    def add(text)
      fail "no task added" if text.empty?
      @todo_list << text
    end

    def see
      list = @todo_list.join(", ")
      "Your todo list is: #{list}"
    end
end