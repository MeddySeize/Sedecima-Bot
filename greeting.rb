
def Greety(tweet)

  client2 = Twitter::REST::Client.new do |config|
    config.consumer_key        = 'noHid5LDRXBDfqfrUUzliNJ8g'
    config.consumer_secret     = 'KaH2XIyOrcx8jdCFX8xOGMKW6b4R0Ib0ubWd8H14hiB4buuQJQ'
    config.access_token        = '1034742694013272064-DQsMj3dtQClFbj62ubh4l3ISEMHN4B'
    config.access_token_secret = 'VgZbRzQHRkcmoBv0kKLe2PuAjNEH6MUwWl9p9PCWLMXoZ'
  end

greet = %w[hey hello hi 你好 hola greeting salut]
puts tweet.text
  # Qui m'a envoye ce tweet?
  name = tweet.user.screen_name
  mess = tweet.text
  rnd = ''
  # le bot lit le message
  read = mess.split(' ')
  read.map!(&:downcase)
  comp = greet & read

  if !comp.empty?
    rnd = greet.sample
    rep = rnd + ' ' + '@' + name
  end
  client2.update(rep)
  puts rep
end