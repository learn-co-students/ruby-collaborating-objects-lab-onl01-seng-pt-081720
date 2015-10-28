# Ruby Collaborating Objects

## Outline

Build an Mp3Importer class that parses a directory of files and sends the filenames to a song class to create a library of music with artists that are unique.

Mp3Importer
`#path`
`#files`
`#import`

Song#new_by_filename (must parse filename at - for song and artist name strings and use those values)
Song artist_name= # must use artist find_or_create_by_name and call artist.add_song

artist uniqueness
