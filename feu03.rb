=begin
Sudoku
Créez un programme qui trouve et aﬃche la solution d’un Sudoku.
Exemples d’utilisation :
$> cat s.txt
1957842..
3.6529147
4721.3985
637852419
8596.1732
214397658
92.418576
5.8976321
7612358.4
$> ruby exo.rb s.txt
195784263
386529147
472163985
637852419
859641732
214397658
923418576
548976321
761235894
Aﬃcher error et quitter le programme en cas de problèmes d’arguments.
=end

doc = File.open(ARGV[0], "r").read.split(/\n/)
i=0

while i < doc.length
    if doc[i].to_i.reduce(0, :+) != 45 && doc[i].length != 8
        next
    elsif doc[i].to_i.reduce(0, :+) != 45 && doc[i].length == 8
        doc[i].gsub(".", 45-(doc[i].to_i.reduce(0, :+)) )
    end
    i+=1
    if i == doc.length
        i==0
    end
    if !doc.each.match(/./)
        break
    end
end



print doc