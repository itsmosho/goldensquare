require "todo"
require "todo_list"

RSpec.describe "integration" do
    context "after adding a task"
    it "can return the task that is not done" do
        todo_list = TodoList.new
        task1 = Todo.new("Task1")
        todo_list.add(task1)
        expect(todo_list.incomplete).to eq [task1]
    end

    it "can return the task that is done" do
        todo_list = TodoList.new
        task1 = Todo.new("Task1")
        task1.mark_done!
        todo_list.add(task1)
        expect(todo_list.complete).to eq [task1]
    end

    it "can return the task that is not done given multiple tasks" do
        todo_list = TodoList.new
        task1 = Todo.new("Task1")
        task2 = Todo.new("Task2")
        task2.mark_done!
        todo_list.add(task1)
        todo_list.add(task2)
        expect(todo_list.incomplete).to eq [task1]
    end

    it "can return the task that is not done given multiple tasks" do
        todo_list = TodoList.new
        task1 = Todo.new("Task1")
        task2 = Todo.new("Task2")
        task2.mark_done!
        todo_list.add(task1)
        todo_list.add(task2)
        expect(todo_list.complete).to eq [task2]
    end


    it "can return all the tasks that are done after giving up" do
        todo_list = TodoList.new
        task1 = Todo.new("Task1")
        task2 = Todo.new("Task2")
        task3 = Todo.new("Task3")
        todo_list.add(task1)
        todo_list.add(task2)
        todo_list.add(task3)
        todo_list.give_up!
        expect(todo_list.complete).to eq [task1, task2, task3]
    end
    
    it "returns an empty array of incomplete tasks after giving up" do
        todo_list = TodoList.new
        task1 = Todo.new("Task1")
        task2 = Todo.new("Task2")
        task3 = Todo.new("Task3")
        todo_list.add(task1)
        todo_list.add(task2)
        todo_list.add(task3)
        todo_list.give_up!
        expect(todo_list.incomplete).to eq []
    end

end
