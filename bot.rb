#!/usr/bin/env ruby

# Faut que t'utilise des méthodes, Meddy.

require 'twitter'
require 'chatterbot/dsl'
require_relative 'greeting.rb'
require_relative 'wiki_ruby'
require_relative 'contain.rb'
require_relative 'confused.rb'

# Connection Twitter
client1 = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = 'noHid5LDRXBDfqfrUUzliNJ8g'
  config.consumer_secret     = 'KaH2XIyOrcx8jdCFX8xOGMKW6b4R0Ib0ubWd8H14hiB4buuQJQ'
  config.access_token        = '1034742694013272064-DQsMj3dtQClFbj62ubh4l3ISEMHN4B'
  config.access_token_secret = 'VgZbRzQHRkcmoBv0kKLe2PuAjNEH6MUwWl9p9PCWLMXoZ'
end


# greet = %w[bonjour salut wesh yo coucou slt cc bjr]

# J'ai ete mentionne?
client1.filter(track: 'sedecima') do |tweet|
  
  a = containingQues(tweet)
  b = containingGreet(tweet)
  if a == true
    SearchWiki(tweet)
  elsif b == true
    Greety(tweet)
  else
    ConfusedBot(tweet)
  end
end


