
--Exercício 1
io.write("Digite o valor de M (início do intervalo): ")
local M = tonumber(io.read())

io.write("Digite o valor de N (fim do intervalo): ")
local N = tonumber(io.read())

io.write("Digite o valor de X (para encontrar os múltiplos): ")
local X = tonumber(io.read())

print("\nMúltiplos de " .. X .. " no intervalo de " .. M .. " até " .. N .. ":")

for num = M, N do
    if num % X == 0 then
        print(num)
    end
end
--------------------------------------------------------------------------------------
--Exercício 2
function maior_valor(t)
    local maior = t[1] 
    for i = 2, #t do
        if t[i] > maior then
            maior = t[i]
        end
    end
    return maior
end
--------------------------------------------------------------------------------------
--Exercício 3
function filtrar_pares(t)
    local pares = {}          
    for i = 1, #t do
        if t[i] % 2 == 0 then
            table.insert(pares, t[i])
        end
    end
    return pares
end

local numeros = {10, 5, 42, 7, 99, 3, 56, 8}
local somente_pares = filtrar_pares(numeros)

io.write("Números pares encontrados: ")
for i = 1, #somente_pares do
    io.write(somente_pares[i] .. " ")
end
print()
----------------------------------------------------------------------------------------
--Exercício 4
function calculadora(a, b, operador)
    if operador == "+" then
        return a + b
    elseif operador == "-" then
        return a - b
    elseif operador == "*" then
        return a * b
    elseif operador == "/" then
        if b ~= 0 then
            return a / b
        else
            return "Erro: divisão por zero!"
        end
    else
        return "Erro: operador inválido!"
    end
end

-- Testes
print(calculadora(10, 5, "+")) 
print(calculadora(10, 5, "-")) 
print(calculadora(10, 5, "*"))  
print(calculadora(10, 5, "/"))  
print(calculadora(10, 0, "/"))  
print(calculadora(10, 5, "%"))  

