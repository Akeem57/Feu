board = File.open(ARGV[0], "r").read.split(/\n/)
target = File.open(ARGV[1], "r").read.split(/\n/)

board_final = []
largeur_board = 0
longueur_board = 0

board.each_index do |a|
    lign_transform = []
    board[a].each_char do |char|  # Utilisez each_char pour itérer sur les caractères de la chaîne
        lign_transform << [char]
    end
    board_final << lign_transform
    largeur_board = lign_transform.length if lign_transform.length > largeur_board
    longueur_board = board_final.length
end

target_final = []
largeur_target = 0
longueur_target = 0

target.each do |lign|
    lign_transform = []
    lign.each_char do |char|
        lign_transform << [char]
    end
    target_final << lign_transform
    largeur_target = lign_transform.length if lign_transform.length > largeur_target
    longueur_target = target_final.length
end

i = 0
a = 0
b = 0
c = 0
d = 0
final_array = []

while i < (longueur_board - longueur_target)
    if board_final[a].nil? || target_final[c].nil? || board_final[a][b].nil? || target_final[c][d].nil?
        final_array << "-"
    elsif board_final[a][b] != target_final[c][d]
        final_array << "-"
    else
        final_array << board_final[a][b]
    end

    b += 1

    if b == largeur_board
        a += 1
        b = 0
    end

    d += 1

    if d == largeur_target
        c += 1
        d = 0
    end

    i += 1
end

