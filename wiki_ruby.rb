#!/usr/bin/env ruby

def SearchWiki(tweet)
  require 'wikipedia_wrapper'
  require 'wikipedia'
  WikipediaWrapper.configure do |config|
    config.lang = 'en'
  end

  client2 = Twitter::REST::Client.new do |config|
    config.consumer_key        = 'noHid5LDRXBDfqfrUUzliNJ8g'
    config.consumer_secret     = 'KaH2XIyOrcx8jdCFX8xOGMKW6b4R0Ib0ubWd8H14hiB4buuQJQ'
    config.access_token        = '1034742694013272064-DQsMj3dtQClFbj62ubh4l3ISEMHN4B'
    config.access_token_secret = 'VgZbRzQHRkcmoBv0kKLe2PuAjNEH6MUwWl9p9PCWLMXoZ'
  end

  puts tweet.text
  # Qui m'a envoye ce tweet?
  name = tweet.user.screen_name
  mess = tweet.text

  # Les phrases que le bot sait dire
  opi = ['I think that', 'i am not sure, but', 'I have no doubt that', 'I think that']
  now = ['?', '...???', 'What is...???', 'What do you want?', 'What do you want to know?']
  ques = %w[who is what where which]

  alea = opi.sample
  nowA = now.sample

  
  mot = mess.split(' ')
  mot.map!(&:downcase)
  comp = ques & mot
  puts comp

  if !comp.empty?
    mot -= %w[who is what where which @sedecima]
    # Est-ce que le mot est là?
    puts mot
    if mot.empty?
      noWarep = '@' + name + ' ' + nowA
      client2.update(noWarep)
      puts nowA
    else
      # Chercher le mot sur wikipedia
      repW = WikipediaWrapper.summary("#{mot}")
      # Met sa phrase d'intro, puis l'intro de wikipedia
      rep = '@' + name + ' ' + alea + ' ' + repW
      client2.update(rep)
      puts repW
    end
  else
    conftab = ['...hum?', 'did not understand', 'Error 404 Sedecima not found', 'much confused', 'OwO?']
    confused = conftab.sample
    confrep =  '@' + name + ' ' + confused
    client2.update(confrep)
  end
end
