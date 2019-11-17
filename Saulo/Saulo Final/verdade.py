print("Seja bem-viado ao quiz supremo do daniel.\n")
print("Soh existe uma regra: soh podestes responder uma vez com `sim` e uma vez com `nao`. Vamos comecar.\n")
perg1 = input("Voze eh gay? ")
perg2 = input("Voze esta mentindo? ")
if perg1 == 's':
    print("Hum. Boiola.")
elif perg1 == 's' and perg2 == 's':
    print("Hmm danadinho, tentando me enganar neh, mas aqui eh treinado.\n")
    perg2 = input("Voze esta mentindo? ")
    while perg2 != 'n':
        perg2 = input("Voze esta mentindo? ")
elif perg1 == 'n' and perg2 == 'n':
     print("Hmm danadinho, tentando me enganar neh, mas aqui eh treinado.\n")
    perg2 = input("Voze esta mentindo? ")
    while perg2 != 's':
        perg2 = input("Voze esta mentindo? ")
