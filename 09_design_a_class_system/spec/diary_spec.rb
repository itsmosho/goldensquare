require "diary"

RSpec.describe "TodoList" do
    it "constructs a todo list" do
        todo_list = TodoList.new
        expect(todo_list.list).to eq []
    end

    context "after adding a todo" do
        it "prints the todo list" do
            todo_list =  TodoList.new
            todo_list.add("Task1")
            expect(todo_list.list).to eq ["Task1"]
        end
    end

    context "after adding multiple todos" do
        it "prints the todo list" do
            todo_list =  TodoList.new
            todo_list.add("Task1")
            todo_list.add("Task2")
            expect(todo_list.list).to eq ["Task1", "Task2"]
        end
    end

end