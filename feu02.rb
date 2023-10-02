=begin
TROUVER UNE FORME

Créez un programme qui aﬃche la position de l’élément le plus en haut à
gauche (dans l’ordre) d’une forme au sein d’un plateau.
Exemples d’utilisation :
$> cat board.txt
0000
1111
2331
$> cat to_find.txt
11
 1
$> cat unfindable.txt
00
00
$> ruby exo.rb board.txt to_find.txt
Trouvé !
Coordonnées : 2,1
----
--11
---1
$> ruby exo.rb board.txt unfindable.txt
Introuvable
Vous devez gérer les potentiels problèmes d’arguments et de lecture de ﬁchiers.
=end


board = File.open(ARGV[0], "r").read.split(/\n/) # = ["0000", "1111", "2331"]
target = File.open(ARGV[1], "r").read.split(/\n/) # = ["11", "1"]
=begin
matches = board.grep(/#{target}/)

if matches
    puts "Trouvé!"
else
    puts "pas de correspondances"
end
=end
board_final = []
largeur_board = []


board.each do |lign| # resultat : [[["0"], ["0"], ["0"], ["0"]], [["1"], ["1"], ["1"], ["1"]], [["2"], ["3"], ["3"], ["1"]]]
    lign_transform = []
    lign.each_char do |char|
        lign_transform << [char]
    end
    board_final << lign_transform
    largeur_board = lign_transform.length
end
longueur_board = board_final.length

=begin             # => resultat : [["0"], ["0"], ["0"], ["0"], ["1"], ["1"], ["1"], ["1"], ["2"], ["3"], ["3"], ["1"]]
board.each do |lign|  => donc osef
    lign.each_char do |char| 
        board_final << [char]
    end
end
=end

target_final = [] 
largeur_target = []

target.each do |lign|        # => resultat : [[["1"], ["1"]], [["1"]]]
    lign_transform = []
    lign.each_char do |char|
        lign_transform << [char]
    end
    target_final << lign_transform
    largeur_target = lign_transform.length
end
  
longueur_target = target_final.length

i=0
a=0
b=0
c=0
d=0
final_array = []
while i < (largeur_board - largeur_target)
    if board_final[a][b] != target_final[c][d]
        final_array << "-"
        b+=1
        if (b == (largeur_board - largeur_target)) && (board_final[a][b] != target_final[c][d]) && (i == (longueur_board - longueur_target))
            final_array << "-"
            break
        elsif b == (largeur_board - largeur_target) && (board_final[a][b] != target_final[c][d])
            final_array << "-" * (largeur_board - largeur_target)
            i+=1
        else
            final_array << board_final[a][b]
        end
    end
end
    
    

print "longueur board : #{longueur_board}"
puts
print "largeur board : #{largeur_board}"
puts
print "longueur target : #{longueur_target}"
puts
print "largeur target : #{largeur_target}"
puts
puts "i : #{i}"
