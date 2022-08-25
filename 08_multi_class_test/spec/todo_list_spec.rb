require "todo_list"

RSpec.describe TodoList do
    xit "adds todo instance" do
        fake_todo = double :fake_todo, done?: true
        monday = TodoList.new
        monday.add(fake_todo)
        expect(monday.incomplete).to eq [fake_todo]
      end
end