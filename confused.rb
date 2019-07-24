def ConfusedBot(tweet)
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
  puts mess

conftab = ['...hum?', 'did not understand', 'Error 404 Sedecima not found', 'much confused', 'OwO?']
    confused = conftab.sample
    confrep =  '@' + name + ' ' + confused
    client2.update(confrep)
end