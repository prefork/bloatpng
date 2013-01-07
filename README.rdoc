= bloatpng

_Bigger is always better._

== About

BloatPNG helps you arbitrarily increase the size of PNG image files without altering their appearance.

== Usage

=== Commandline

`bloat INPUT_FILE OUTPUT_FILE KILOBYTES_TO_ADD`

=== In your ruby code

`BloatPNG.bloat(input_filename, output_filename, optional_bytes_to_add)`

For example, to inflate the file `smiley.png` by 1MB and save it as 'sad.png'

`BloatPNG.bloat('smiley.png', 'sad.png', 1*1024*1024)`

== Contributing to bloatpng
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

== Copyright

Copyright (c) 2012 Nate Benes. See LICENSE.txt for
further details.

