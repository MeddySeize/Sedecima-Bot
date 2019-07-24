def containingQues(tweet)
    # on définit les mot qui doivent être dans le tweet
    impWord = %w[who is what where which]
    # on analyse la phrase
    ques = tweet.text
    split = ques.split(' ')
    compWik = split & impWord

    if !compWik.empty?
      return true
    end

end

def containingGreet(tweet)
  greet = %w[hey hello hi 你好 hola greeting salut]
  mess = tweet.text

  read = mess.split(' ')
  read.map!(&:downcase)
  comp = greet & read

  if !comp.empty?
    return true
  end

end

def containingConf(tweet)
  greet = %w[hey hello hi 你好 hola greeting salut]
  ques = %w[who is what where which]

  mess = tweet.text
  read = mess.split(' ')
  read.map!(&:downcase)
  comp = read & greet & ques
end