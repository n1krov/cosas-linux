
n = input("Numero de repeticiones de GAONA: ")

try:
    n = int(n)
except ValueError:
    print("Error: Debe ingresar un numero entero")
    exit()

for i in range(n):
    print("GAONA")
