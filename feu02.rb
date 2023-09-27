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

matches = board.grep(/#{target}/)

if matches
    puts "Trouvé!"
else
    puts "pas de correspondances"
end

board_final = []

board.each do |lign| # resultat : [[["0"], ["0"], ["0"], ["0"]], [["1"], ["1"], ["1"], ["1"]], [["2"], ["3"], ["3"], ["1"]]]
    lign_transform = []
    lign.each_char do |char|
        lign_transform << [char]
    end
    board_final << lign_transform
end

=begin             # => resultat : [["0"], ["0"], ["0"], ["0"], ["1"], ["1"], ["1"], ["1"], ["2"], ["3"], ["3"], ["1"]]
board.each do |lign|  => donc osef
    lign.each_char do |char| 
        board_final << [char]
    end
end
=end

target_final = []  # => resultat : [[["1"], ["1"]], [["1"]]]
target.each do |lign|
    lign_transform = []
    lign.each_char do |char|
        lign_transform << [char]
    end
    target_final << lign_transform
end
  


