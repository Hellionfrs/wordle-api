# config/initializers/random_words.rb

# Require necessary libraries
require 'thread'
require 'random_word'

# Initialize a thread-safe queue to hold random words
RANDOM_WORDS_QUEUE = Queue.new

# Populate the queue with random words during application startup
RandomWord.nouns.each { |word| RANDOM_WORDS_QUEUE << word }
