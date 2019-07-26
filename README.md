# Ruby Collaborating Objects Lab

## Objective

- Gain a deeper understanding of object relations.
- Build classes that interact with one another through associations and behavior.

## Instructions

This is a test-driven lab. Use the test file and test output to understand what
is being asked of you as you follow the guidelines below.

In this lab, we'll be dealing with an `Artist` class, a `Song` class, and an
`MP3Importer` class.

Because of the relationships between your classes, the `Artist` tests, i.e. the
tests in `spec/artist_spec.rb`, rely on some code in the `Song` class and vice
versa. So, as you proceed through solving this lab, you will go back and forth
between coding in `Artist` and `Song`.

We recommend starting out by getting some of the initial `Artist` tests passing
and switching to write code in the `Song` class as directed by the test output.
Because of the complexity, let's walk through a guideline of how to think about
the problem as you're building out the solution.

## Overview

You will be building an `Artist` class, a `Song` class, and an `MP3Importer`
class. At the top level, you can think about what we'll be doing in 3 steps:

1. The `MP3Importer` class will parse all the filenames in the `spec/fixtures` folder
   and send the filenames to the Song class
2. The `Song` class will be responsible for creating songs given each filename and
   sending the artist's name (a string) to the Artist class
3. The `Artist` class will be responsible for either creating the artist (if the
   artist doesn't exist in our program yet) or finding the instance of that
   artist (if the artist does exist).

Thinking about it this way will get us started. From this breakdown, it looks
like the `MP3Importer` relies on `Song` in order to do its job of parsing
filenames. `Song` relies on the `Artist` instances to build associations.
Therefore, we'll start by working on `Artist`. Keep in mind though, that you
will need to be build out related classes together in order to pass some tests,
as they work in collaboration.

### `Artist` class

An `Artist` be initialized with a name and should have an attribute accessor
for this name. The class should have an `@@all` class variable and store all
`Artist` instances in this variable.

#### `Artist.all`

This class method should return all `Artist` instances.

#### `Artist#add_song`

This instance method exists to tell a pased in `Song` instance it belongs to
_this_ `Artist` instance.

#### `Artist#songs`

This instance method returns an Array of all songs that belong to this `Artist`
instance. This method should get all existing `Song` instances from `Song` and
select only the ones that are associated with this `Artist` instance.

#### `Artist.find_or_create_by_name`

This class method should take the name that is passed in (remember, it will be a
string), and do one of two things. Find the artist instance that has that name
or create one if it doesn't exist. Either way, the return value of the method
will be an instance of an artist with the name attribute filled out.

#### `Artist#print_songs`

This instance methods outputs the names of all songs associated with this
`Artist` instance.

### `Song` class

A `Song` should be iniitialized with a name and have attribute accessors for
**name** and **artist**. The `Song` class should have an `@@all` class variable
and store all `Song` instances in this variable.

#### `Song.all`

This class method should return all `Artist` instances.

#### `Song.new_by_filename`

This method will do four things:

1. It must parse a filename to find the song name and artist name. (_Hint: every
   file separates the song and artist with a `" - "`_). Now we put those values
   to use.

2. From here, we will create a new song instance using the string we gathered
   from the filename.

3. We'll also want to associate that new song with an artist. Use the `artist`
   attribute accessor to assign this

4. Return the new song instance.

You may have seen something similar in the past where we have the instance of
the artist. If we had the artist object, we could simply assign the artist to
the song with some code that looks like this: `our_song_instance.artist =
our_artist_instance`. Since we only have the artist name as a string (not an
instance of the Artist class), we'll create a method that takes in the name and
gets the artist object. Let's call this `Song#artist_name=`.

#### `Song#artist_name=`

This method will do two things. Both of these things will involve collaboration
with the `Artist` class:

1. Turn the artist's name as a string into an `Artist` object

    First we need to get the instance of the `Artist` class that represents that
    artist. There are two possibilities here:

    1. Either we have to create that `Artist` instance
    2. Or it already exists and we have to find that `Artist` instance.

    To achieve this, we'll need to collaborate with the `Artist` class. We want to
    send an artist's name (a string--remember we are getting this from the
    parsed filename) to the `Artist` class to achieve the functionality described
    above in #1 and #2. This sounds like a great place to use method
    `Artist.find_or_create_by_name`.

2. Assign the song to the artist (Since an artist has many songs, we'll want to
   make this association)

    Now that we have the artist instance, we'll want to again collaborate with
    the `Artist` class by calling on the `Artist#add_song(some_song)` method.

### `MP3Importer` class

Build an `MP3Importer` class that parses a directory of files and sends the
filenames to a song class to create a library of music with artists that are
unique. To do this, you'll need two methods: `Mp3Importer#files` and
`MP3Importer#import`. Your `MP3Importer` class should also have a `path`
attribute that gets set on initialization.

You should write code that responds to
`MP3Importer.new('./spec/fixtures').import`. Google around for how to get a list
of files in a directory! Make sure you only get `.mp3` files.

Since we have to send the filenames to the `Song` class, we'll end up calling
the following code in the `#import` method:
`Song.new_by_filename(some_filename)`. This will send us to the `Song` class,
specifically `Song.new_by_filename` and handle the creation of `Song` instances
and their associated `Artist` instances.

### Conclusion

These are just a few hints and guidelines to help you through this lab. Rely on
the guides here, refer to the previous lessons on object relations, and
**read the test output and test files**. Never forget to ask a question on Learn
if you are stuck. Good luck!

<p class='util--hide'>View <a href='https://learn.co/lessons/ruby-collaborating-objects-lab'>Collaborating Objects Lab</a> on Learn.co and start learning to code for free.</p>
