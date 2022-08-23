class Todo
    def initialize # name is a string
      @todo = []
    end
  
    def add(task) # task is a string
      @todo << task
    end
  
    def complete(task)
      # deletes completed task from the array  
      @todo.delete(task)


    end
    
    def list
      # lists each task on the array. .each { |task| puts task}
      @todo
    end
end