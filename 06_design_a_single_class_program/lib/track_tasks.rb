class TaskTracker 
    def initialize
      @todo_list = []
    end

    def add(text)
      fail "no task added" if text.empty?
      @todo_list << text
    end

    def see
      "Your todo list is: #{@todo_list}"
    end
end