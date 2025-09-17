// Questão
#include <iostream>
using namespace std;


int fibonacci(int n) {
    if (n == 0) {
        return 0; // Caso base
    } else if (n == 1) {
        return 1; // Caso base
    } else {
        return fibonacci(n - 1) + fibonacci(n - 2);
    }
}

int main() {
    int n;
    cout << "Digite um numero: ";
    cin >> n;

    cout << "Fibonacci(" << n << ") = " << fibonacci(n) << endl;

    return 0;
}
-------------------------------------------------------------------------
//Questão 2
#include <iostream>
using namespace std;


float somarArray(float arr[], int tamanho) {
    float soma = 0;
    for (int i = 0; i < tamanho; i++) {
        soma += arr[i];
    }
    return soma;
}

int main() {
    int tamanho;
    cout << "Digite o tamanho do array: ";
    cin >> tamanho;

    float arr[tamanho];

    cout << "Digite os valores do array:" << endl;
    for (int i = 0; i < tamanho; i++) {
        cin >> arr[i];
    }

    float resultado = somarArray(arr, tamanho);
    cout << "A soma dos valores do array eh: " << resultado << endl;

    return 0;
}
-------------------------------------------------------------------------
//Questão 3
#include <iostream>
using namespace std;

int main() {
    int quantidade;
    cout << "Digite quantas notas deseja inserir: ";
    cin >> quantidade;

    float nota, soma = 0;

    for (int i = 0; i < quantidade; i++) {
        cout << "Digite a nota " << i + 1 << ": ";
        cin >> nota;


        while (nota < 0 || nota > 10) {
            cout << "Nota invalida! Digite novamente (entre 0 e 10): ";
            cin >> nota;
        }

        soma += nota;
    }

    float media = soma / quantidade;

    cout << "Media final: " << media << endl;

    if (media >= 7) {
        cout << "Aprovado" << endl;
    } else {
        cout << "Reprovado" << endl;
    }

    return 0;
}
-------------------------------------------------------------------------------
//Questão 4
#include <iostream>
using namespace std;


double celsiusParaFahrenheit(double celsius) {
    return (celsius * 9.0 / 5.0) + 32.0;
}


double celsiusParaKelvin(double celsius) {
    return celsius + 273.15;
}

int main() {
    int opcao;
    double celsius, resultado;

    do {
        cout << "\n===== Menu de Conversao =====\n";
        cout << "1. Converter Celsius para Fahrenheit\n";
        cout << "2. Converter Celsius para Kelvin\n";
        cout << "3. Sair\n";
        cout << "Escolha uma opcao: ";
        cin >> opcao;

        switch (opcao) {
            case 1:
                cout << "Digite a temperatura em Celsius: ";
                cin >> celsius;
                resultado = celsiusParaFahrenheit(celsius);
                cout << "Resultado: " << resultado << " Fahrenheit" << endl;
                break;

            case 2:
                cout << "Digite a temperatura em Celsius: ";
                cin >> celsius;
                resultado = celsiusParaKelvin(celsius);
                cout << "Resultado: " << resultado << " Kelvin" << endl;
                break;

            case 3:
                cout << "Saindo..." << endl;
                break;

            default:
                cout << "Opcao invalida! Tente novamente." << endl;
        }

    } while (opcao != 3);

    return 0;
}
