require "todo"

RSpec.describe Todo do
    context "initially" do
        it "with a task " do
            todo = Todo.new("Task1")   
            expect(todo.task).to eq "Task1"
        end
    end

    it "can mark a task as completed" do
        task = Todo.new("Task1")
        task.mark_done!
        expect(task.done?).to eq true
    end

end
