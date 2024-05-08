class WordsController < ApplicationController
  def random_word
    length = params[:length].to_i
    word = nil

    # Dequeue a random word from the thread-safe queue
    if !RANDOM_WORDS_QUEUE.empty?
      word = RANDOM_WORDS_QUEUE.pop
    else
      # Queue is empty, handle this case (e.g., refill the queue or return an error)
      # For simplicity, you can refill the queue with all words again
      RandomWord.nouns.each { |w| RANDOM_WORDS_QUEUE << w }
      word = RANDOM_WORDS_QUEUE.pop unless RANDOM_WORDS_QUEUE.empty?
    end

    render json: { word: word }
  end
end
