require "task_formatter"

RSpec.describe TaskFormatter do

    it "returns the formatted incomplete task" do
        task_1 = double(:task, title: "FAKE", complete?: false)
        formatter = TaskFormatter.new(task_1)
        expect(formatter.format).to eq " - [ ] FAKE"
      end
    

    it "returns the formatted complete task" do
        task_1 = double(:task, title: "FAKE", complete?: true)
        formatter = TaskFormatter.new(task_1)
        expect(formatter.format).to eq " - [x] FAKE"
    end

end