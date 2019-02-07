greet = ['bonjour', 'salut', 'wesh', 'yo', 'coucou', 'slt', 'cc', 'bjr']

phr = gets.chomp.to_s
user = 'Meddy'
rnd = ''
mot = phr.split(',')
mot.map!(&:downcase)
comp = greet & mot

if !comp.empty?
  rnd = greet.sample
end

rep = rnd + ' ' + user
puts rep