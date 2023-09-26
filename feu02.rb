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
#result = []

=begin
File.open(ARGV[0], 'r') do |file|
    line_index = 0

    file.each_line do |ligne|
      char_index = 0

      ligne.chomp.each_char do |caractere|
        result << [caractere, line_index, char_index]
        char_index += 1
      end
  
      line_index += 1
    end
end
  
  result.each do |item|
    print "#{item[0]} [#{item[1]}, #{item[2]}]"
    puts
=end

    
board = File.open(ARGV[0], "r").read.split(/\n/) # = ["0000", "1111", "2331"]
target = File.open(ARGV[1], "r").read.split(/\n/) # = ["11", "1"]

matches = board.grep(/#{target}/)

if matches
    puts "Trouvé!"
else
    puts "pas de correspondances"
end


i=0
j=0
k=0
l=0
result=[]
x=0
y=0
while i < board.length
    if board[i][j] == target[k][l] && board[i][j+1] == target[k][l+1] && ((board[i+1][j] == target[k+1][l]) || (board[i+1][j+1] == target[k+1][l]))
        result << board[i][j]
        x= j
        y= i
    else
        result << "-"
    end
    j += 1
    if j == board[i].length
        j=0
        i+=1
        result << "\n"
    end
    if i == board.length
        break
    end

end

puts result.join("")

puts "Coordonnées : #{x}, #{y}"


