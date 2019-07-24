#!/usr/bin/env ruby

require 'wikipedia_wrapper'
require 'wikipedia'
WikipediaWrapper.configure do |config|
  config.lang = 'en'
end

# Les phrases que le bot sait dire
opi = ['I think that', 'i am not sure, but', 'I have no doubt that', 'I think that']
now = ['?', '...???', 'What is...???', 'What do you want?', 'What do you want to know?']
ques = %w[who is what where which]
# initialisation du alea
alea = ''
# Le bot va piocher une phrase au hasard dans son cerveau :)
alea = opi.sample
nowA = now.sample
# On prend l'entrée de l'utilisateur
inp = gets.chomp.to_s
# On découpe la phrase en petit morceau: Le bot lit la phrase. 8o
mot = inp.split(' ')
# Puis on le met en minuscule pour éviter d'avoir des erreurs à cause des Maj
mot.map!(&:downcase)
#Faire un comparatif des deux éléments  et les mettre dans un tableau. Uniquement ceux qui se ressemble seront dans le tableau
comp = ques & mot
puts comp
if !comp.empty?
# Retirer "what is" et "who is" pour ce concentrer sur le mot à chercher
mot -= %w[who is what where which]
# Est-ce que le mot est là?
if mot.empty?
  puts nowA
else
# Chercher le mot sur wikipedia
repW = WikipediaWrapper.summary("#{mot}")
# Met sa phrase d'intro, puis l'intro de wikipedia
puts alea + ' ' + repW
puts repW
end
else
  conftab = ['...hum?', 'did not understand', 'Error 404 Sedecima not found', 'much confused', 'OwO?']
  Confused = conftab.sample
  puts Confused

end
