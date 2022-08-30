require "diary"
require "diary_entry"
require "todo_list"

RSpec.describe "integration" do 
    it "constructs" do
        diary = Diary.new
        expect(diary.list).to eq []
    end
   
   
    it "Lists all diary entries" do
        diary = Diary.new
        entry_1 = DiaryEntry.new("Hello", "Hello World")
        entry_2 = DiaryEntry.new("World", "My name is Moses")
        diary.add(entry_1)
        diary.add(entry_2)
        expect(diary.list).to eq [entry_1, entry_2]
    end

    context "after adding multiple entries"
    it "Finds all diary entries that can be read within given reading time" do
        diary = Diary.new
        entry_1 = DiaryEntry.new("Hello", "Hello World")
        entry_2 = DiaryEntry.new("World", "My name is Moses")
        entry_3 = DiaryEntry.new("Long", "This is the longest string ever " * 10)
        diary.add(entry_1)
        diary.add(entry_2)
        diary.add(entry_3)
        result = diary.find_best_entries(2, 2)
        expect(result).to eq [entry_1, entry_2]
    end

    it "constructs a todo list" do
        todo_list = TodoList.new
        expect(todo_list.list).to eq []
    end

    context "after adding a todo" do
        it "prints the todo list" do
            diary = Diary.new
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

    context "after adding phone numbers in the diary" do
        it "shows the list of phone numbers" do
            diary =  Diary.new
            entry_1 = DiaryEntry.new("Hello", "Hello World 07864567321")
            entry_2 = DiaryEntry.new("World", "My number is 07950911238")
            diary.add(entry_1)
            diary.add(entry_2)
            expect(diary.numbers).to eq ["07864567321", "07950911238"]
        end
    end


end