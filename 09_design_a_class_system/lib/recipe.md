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
Class DiaryEntry
  def read_entry(title)
    # @diary = [entry1, entry2]
    @diary.select { |entry| entry.title == title}
  end
end
```
As a user
So that I can reflect on my experiences in my busy day
I want to select diary entries to read based on how much time(minutes) I have and my reading speed(wpm)
```rb
Class Diary
  def find_reable_entries_for_reading_time(wpm, minutes)
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
│   => [tracks...]           │
└───────────┬────────────────┘
            │
            │ owns a list of
            ▼
┌─────────────────────────┐
│ Track(title, artist)    │
│                         │
│ - title                 │
│ - artist                │
│ - format                │
│   => "TITLE by ARTIST"  │
└─────────────────────────┘
```

_Also design the interface of each class in more detail._

```ruby
class Diary
  def initialize
    @diary = []
  end

  def add(entry) # entry is an instance of DisryEntry
    # entry gets added to the @diary
    # Returns nothing
  end

  def all
    # Returns a list of entries in @diary
  end
  
  def find_best_entry_for_reading_time(wpm, minutes)
    #return a list of readable diary entries to read based on how much time(minutes) I have and my reading speed(wpm)

  end
end

class DiaryEntry
  def initialize(title, contents)
    @title = title
    @contents = contents
  end

  def format
    # Returns a string of the form "TITLE by ARTIST"
  end
end
```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
# EXAMPLE

# Gets all tracks
library = MusicLibrary.new
track_1 = Track.new("Carte Blanche", "Veracocha")
track_2 = Track.new("Synaesthesia", "The Thrillseekers")
library.add(track_1)
library.add(track_2)
library.all # => [track_1, track_2]
```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# EXAMPLE

# Constructs a track
track = Track.new("Carte Blanche", "Veracocha")
track.title # => "Carte Blanche"
```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._