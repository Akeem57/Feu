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

=begin
def script_from_shell(argument)
    exe = eval(argument)  #eval récupère une chaîne de caractère en argument et l'exécute tel quel, comme du code ruby!
    return exe
end

argument = ARGV[0]

result = script_from_shell(argument)
puts result
=end

def operateur?(caractere)
    return ['+', '-', '*', '/', '%'].include?(caractere) # renvoi true si ça match
end

def priorite(operateur)
    case operateur
        when '+', '-' then return 1
        when '*', '/', '%' then return 2
    else 
        return 0
    end
end

def effectuer_operation(operande1, operande2, operateur)
    case operateur
        when '+' then return operande1 + operande2
        when '-' then return operande1 - operande2
        when '*' then return operande1 * operande2
        when '/' then return operande1 / operande2
        when '%' then return operande1 % operande2
    end
  end

def evaluer_expression(expression)
    expression = expression.gsub(" ", "")
    
    numbers = []
    operators = []
    
    i = 0
    while i < expression.length
      if expression[i] == '('           
        operators << expression[i]
        i += 1
      elsif expression[i] == ')'        
        while operators.last != '('
          operateur = operators.pop
          operande2 = numbers.pop
          operande1 = numbers.pop
          resultat = effectuer_operation(operande1, operande2, operateur)
          numbers << resultat
        end
        operators.pop                   
        i += 1
      elsif operateur?(expression[i])    
        while !operators.empty? && priorite(expression[i]) <= priorite(operators.last)
          operateur = operators.pop
          operande2 = numbers.pop
          operande1 = numbers.pop
          resultat = effectuer_operation(operande1, operande2, operateur)
          numbers << resultat
        end
        operators << expression[i]       
        i += 1
      else
        j = i                           
        while j < expression.length && (expression[j] =~ /[0-9]/)
          j += 1
        end
        numbers << expression[i...j].to_f
        i = j
      end
    end
    
    while !operators.empty?
      operateur = operators.pop
      operande2 = numbers.pop
      operande1 = numbers.pop
      resultat = effectuer_operation(operande1, operande2, operateur)
      numbers.push(resultat)
    end
    
    return  numbers.first
  end
  

  expression = ARGV[0]
  resultat = evaluer_expression(expression)
  puts resultat