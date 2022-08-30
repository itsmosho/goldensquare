# {{PROBLEM}} Multi-Class Planned Design Recipe

## 1. Describe the Problem

_Put or write the user story here. Add any clarifying notes you might have._
As a user
So that I can record my experiences
I want to keep a regular diary
```ruby
Class Diary
end
```
As a user
So that I can reflect on my experiences
I want to read my past diary entries
```ruby
# Class DiaryEntry
#   def read(title)
#     # @diary = [entry1, entry2]
#     @diary.select { |entry| entry.title == title}
    
  end
end
```
As a user
So that I can reflect on my experiences in my busy day
I want to select diary entries to read based on how much time(minutes) I have and my reading speed(wpm)
```rb
Class Diary
  def find_reable_entries(wpm, minutes)
  end
end
```
As a user
So that I can keep track of my tasks
I want to keep a todo list along with my diary
```rb
Class Todolist
end
```
As a user
So that I can keep track of my contacts
I want to see a list of all of the mobile phone numbers in all my diary entries
```rb
Class DiaryEntry
  def extract_phone_numbers
  end
end 
```

## 2. Design the Class System

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

```
┌────────────────────────────┐
│ Diary                │
│                            │
│ - add(entry)               │
│ - all                      │
│ - find_best_entry_for_reading_time(wpm, minutes) │
│   => [entries...]           │
└───────────┬────────────────┘
            │
            │ owns a list of
            ▼
┌─────────────────────────┐
│ DiaryEntry(Title, contents)    │
│                         │
│ - title                 │
│ - contents                │
│ - extract_phone_number                │
│   => "Title, Contents"  │
└─────────────────────────┘
```

_Also design the interface of each class in more detail._

```ruby
class Diary
  def initialize
    @diary = []
  end

  def read(title)
    # @diary = [entry1, entry2]
    @diary.select { |entry| entry.title == title}
  end

  def add(entry) # entry is an instance of DisryEntry
    # entry gets added to the @diary
    # Returns nothing
  end

  def list
    # Returns a list of entries in @diary
    @diary
  end
  
  def find_best_entries(wpm, minutes)
    #return a list of readable diary entries to read based on how much time(minutes) I have and my reading speed(wpm)
  end

  def numbers
    # Returns a list of phone numbers as stringsnin all the diary entries
    @diary.select(&:extract_phone_numebrs)
  end
end


class DiaryEntry
  def initialize(title, contents)
    @title = title
    @contents = contents
    @numbers = []
  end

  def read
  @contents
  end

  def extract_phone_numbers
    #if "number starts with 0 and 11 (.length == 11)/ends in a number" as a string
    @numbers << phone_number
  end
end

Class TodoList
  def initialize(todo)
    @todo_list = []
    @todo_list << todo
  end

  def list
    @todo_list
  end
end



```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
# EXAMPLE



# Lists all diary entries
diary = Diary.new
entry_1 = DiaryEntry.new("Hello", "Hello World")
entry_2 = DiaryEntry.new("World", "My name is Moses")
dairy.add(entry_1)
diary.add(entry_2)
dairy.list  # => [entry_1, entry_2]


# Finds all diary entries that can be read within given reading time
diary = Diary.new
entry_1 = DiaryEntry.new("Hello", "Hello World")
entry_2 = DiaryEntry.new("World", "My name is Moses")
entry_3 = DiaryEntry.new("Long", "This is the longest string ever" * 10)
dairy.add(entry_1)
diary.add(entry_2)
diary.add(entry_3)
dairy.find_best_entries(2, 2)  # => [entry_1, entry_2]

# Lists all phone numbers in all entries
diary = Diary.new
entry_1 = DiaryEntry.new("Hello", "Hello World my number is 07854876354")
entry_2 = DiaryEntry.new("World", "My name is Moses 08976345221, my friends number is 07865789567")
diary.add(entry_1)
diary.add(entry_2)
diary.extract_phone_numbers  # => ["07854876354", "08976345221", "07865789567"]


```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# EXAMPLE



# Reads a diary entry
diary_entry = DiaryEntry.new("Hello", "Hello World")
diary_entry.read # => ["Hello", "Hello World"]

# Constructs a Todolist 

todo_list = Todolist.new
todo_list.list  # => []

# After adding a Todo, print the Todolist
todo_list = Todolist.new("Task1")
todo_list.list  # => ["Task1"]

# After constructing a diary entry with no phone mumber, extract phone number fails
diary_entry = DiaryEntry.new("Hello", "Hello World")
diary_entry.extract_phone_numbers # =>  fail "No numbers found"


# After constructing a diary entry containing a phone number, the number is extracted

diary_entry = DiaryEntry.new("Hello", "Hello World my number is 07854876354")
diary_entry.extract_phone_numbers # =>  fail ["{07854876354}"]





```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._