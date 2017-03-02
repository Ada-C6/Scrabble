#KNK: I have also just copied the contents of the Rakefile that was included in the in-class TDD demo.
#KNK: The Rakefile lives inside the Scrabble folder, but outside of the specs directory.
#KNK: To run the rake tests, just be inside the Scrabble directory in your terminal and type 'rake' (without the ').

require 'rake/testtask'

Rake::TestTask.new do |t|
   t.test_files = FileList['specs/*_spec.rb'] #this is the set of files that will be tested.
 end

task default: :test
