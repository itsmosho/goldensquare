require "todo_list"

  
RSpec.describe Todo do
  it "constructs" do
    todo = Todo.new
    expect(todo.list).to eq []
  end
  
  it "adds task to list" do
    todo  = Todo.new
    todo.add("Task")
    expect(todo.list).to eq ["Task"]
  end

  it "can add more than one task to list" do
    todo = Todo.new
    todo.add("Task1")
    todo.add("Task2")
    expect(todo.list).to eq ["Task1", "Task2"]
  end
  
  it "removes a task from the list" do
    todo = Todo.new
    todo.add("Task1")
    todo.add("Task2")
    todo.complete("Task1")
    expect(todo.list).to eq ["Task2"]
  end
end
  