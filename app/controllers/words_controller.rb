require 'thread'
require 'random_word'
class WordsController < ApplicationController
  RANDOM_WORDS_QUEUE = Queue.new
  def random_word
    length = params[:length].to_i
    word = nil

    # Populate the queue with random words of the specified length during application startup
    RandomWord.nouns(not_shorter_than: length, not_longer_than: length).each do |word|
      RANDOM_WORDS_QUEUE << word
    end
    

    # Dequeue a random word from the thread-safe queue matching the specified length
    loop do
      break if RANDOM_WORDS_QUEUE.empty?

      candidate_word = RANDOM_WORDS_QUEUE.pop
      if candidate_word.length == length
        word = candidate_word
        break
      end
    end

    if word.nil?
      render json: { error: "No words of length #{length} available in the queue" }, status: :not_found
    else
      render json: { word: word }
    end
  end
end
