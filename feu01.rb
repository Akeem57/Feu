=begin
ÉVALUER UNE EXPRESSION

Créez un programme qui reçoit une expression arithmétique dans une chaîne de caractères et en
retourne le résultat après l’avoir calculé.
Vous devez gérer les 5 opérateurs suivants : “+” pour l’addition, “-” pour la soustraction, “*” la
multiplication, “/” la division et “%” le modulo.
Exemple d’utilisation :
$> ruby exo.rb “4 + 21 * (1 - 2 / 2) + 38”
42
Vous pouvez partir du principe que la chaîne de caractères donnée en argument sera valide.
=end


def script_from_shell(argument)
    exe = eval(argument)  #eval récupère une chaîne de caractère en argument et l'exécute tel quel, comme du code ruby!
    return exe
end

argument = ARGV[0]

result = script_from_shell(argument)
puts result