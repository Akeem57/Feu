=begin
ECHAUFFEMENT

Créez un programme qui aﬃche un rectangle dans le terminal.
Exemples d’utilisation :
$> python exo.py 5 3
o---o
|   |
o---o
$> python exo.py 5 1
o---o
$> python exo.py 1 1
o
Gérer les problèmes potentiels d’arguments.
=end


column = ARGV[0].to_i
lines = ARGV[1].to_i

if column == 1 && lines == 1
    puts "o"
elsif column != 1 && lines == 1
    puts "o" + ("-")*(column-2) + "o" 
elsif column != 1 && lines != 1
    puts "o" + ("-")*(column-2) + "o" 
  
    (lines-2).times do                      # .times => exécute le bloc de code n fois => n times
        puts "|" + (" ")*(column-2) + "|"
    end

    puts "o" + ("-")*(column-2) + "o" 
end



