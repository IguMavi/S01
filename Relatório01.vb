##Questão 1
10 INPUT "Digite a primeira nota: "; N1
20 INPUT "Digite a segunda nota: "; N2
30 MEDIA = (N1 + N2) / 2
40 IF MEDIA >= 60 THEN PRINT "Aprovado direto" ELSE GOTO 60
50 GOTO 120
60 IF MEDIA < 30 THEN PRINT "Reprovado direto" ELSE GOTO 80
70 GOTO 120
80 PRINT "Digite a nota da NP3"
90 INPUT "Digite a nota da NP3: "; N3
100 MEDIA2 = (N1 + N2 + N3) / 3
110 IF MEDIA2 > 50 THEN PRINT "Aprovado pela NP3" ELSE PRINT "Reprovado na NP3"
120 END
------------------------------------------------------------------------------------
##Questão 2    
10 NUM = INT(RND * 101)
20 PRINT "Tente adivinhar o número entre 0 e 100"
30 INPUT "Digite seu palpite: "; PALPITE
40 IF PALPITE = NUM THEN GOTO 80
50 IF PALPITE < NUM THEN PRINT "O número correto é MAIOR"
60 IF PALPITE > NUM THEN PRINT "O número correto é MENOR"
70 GOTO 40
80 PRINT "Parabéns! Você acertou o número!"
90 END
-----------------------------------------------------------------------------------
 ##Questão 3
10 INPUT "Digite a temperatura em Celsius:"; C
20 K = C + 273.15
30 F = (C * 9 / 5) + 32
40 PRINT "Temperatura em Celsius: "; C
50 PRINT "Temperatura em Kelvin: "; K
60 PRINT "Temperatura em Fahrenheit: "; F
70 END
-----------------------------------------------------------------------------------
##Questão 4
10 INPUT "Digite a sua altura"; ALTURA
20 INPUT "Digite seu peso em quilogramas:"; PESO
30 IMC = PESO / (ALTURA * ALTURA)
40 PRINT "Seu IMC é: "; IMC
50 END

