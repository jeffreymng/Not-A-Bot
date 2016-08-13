module MarkovHelper

  def generate_tweet(text)

    markov = MarkyMarkov::TemporaryDictionary.new
    markov.parse_string text
    x = markov.generate_n_sentences 2
    x = markov.generate_n_words 15
    markov.clear!

    return x

  end


end
