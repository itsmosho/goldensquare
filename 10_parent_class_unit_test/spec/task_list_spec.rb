require "task_list"

RSpec.describe TaskList do
  it "initially has an empty list" do
    task_list = TaskList.new
    expect(task_list.all).to eq []
  end

  it "adds tasks to a list" do
    task_list = TaskList.new
    task_1 = double(:task, title: "Walk the dog")
    task_2 = double(:task, title: "Walk the cat")
    task_list.add(task_1)
    task_list.add(task_2)
    expect(task_list.all).to eq [task_1, task_2]
  end

  it "is initially not all complete" do
    task_list = TaskList.new
    expect(task_list.all_complete?).to eq false
  end

  it "makes a list of tasks that are complete" do
    task_list = TaskList.new
    task_1 = double(:task, title: "Walk the dog")
    task_2 = double(:task, title: "Walk the cat")
    task_list.add(task_1)
    task_list.add(task_2)
    allow(task_1).to receive(:complete?).and_return(true)
    allow(task_2).to receive(:complete?).and_return(true)
    expect(task_list.all_complete?).to eq true
  end

  # Unit test `#all` and `#all_complete?` behaviour
end