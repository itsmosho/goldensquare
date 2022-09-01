class TodoList
    def initialize
      @todo_list = []
    end
    def add(todo)
      @todo_list << todo
    end
  
    def list
      @todo_list
    end
end