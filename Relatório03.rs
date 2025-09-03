//Questão 1
use std::io;


fn verificar_senha(senha: &str) -> bool {
    let tem_tamanho = senha.len() >= 8;
    let tem_numero = senha.chars().any(|c| c.is_ascii_digit());
    let tem_maiuscula = senha.chars().any(|c| c.is_ascii_uppercase());

    tem_tamanho && tem_numero && tem_maiuscula
}

fn main() {
    loop {
        let mut entrada = String::new();
        println!("Digite uma senha:");

        io::stdin()
            .read_line(&mut entrada)
            .expect("Erro ao ler a entrada");

        let senha = entrada.trim();

        if verificar_senha(senha) {
            println!("Senha válida! Acesso concedido.");
            break;
        } else {
            println!("Senha inválida. Tente novamente.");
        }
    }
}
-----------------------------------------------------------------------------------------------
//Questão 2
use std::io;


fn eh_par(numero: i32) -> bool {
    numero % 2 == 0
}

fn main() {
    let mut entrada = String::new();

    
    println!("Jogador 1, escolha 'par' ou 'ímpar':");
    io::stdin().read_line(&mut entrada).expect("Erro ao ler entrada");
    let escolha = entrada.trim().to_lowercase();
    entrada.clear();

    
    println!("Jogador 1, digite um número inteiro:");
    io::stdin().read_line(&mut entrada).expect("Erro ao ler número");
    let num1: i32 = entrada.trim().parse().expect("Por favor, digite um número válido");
    entrada.clear();

    
    println!("Jogador 2, digite um número inteiro:");
    io::stdin().read_line(&mut entrada).expect("Erro ao ler número");
    let num2: i32 = entrada.trim().parse().expect("Por favor, digite um número válido");

   
    let soma = num1 + num2;


    let resultado_par = eh_par(soma);

    println!("\nJogador 1 escolheu: {}", escolha);
    println!("Jogador 1 jogou: {}", num1);
    println!("Jogador 2 jogou: {}", num2);
    println!("Soma: {} → {}", soma, if resultado_par { "par" } else { "ímpar" });

  
    if (resultado_par && escolha == "par") || (!resultado_par && escolha == "ímpar") {
        println!("Jogador 1 venceu!");
    } else {
        println!("Jogador 2 venceu!");
    }
}
---------------------------------------------------------------------------------------------------------------
//Questão 3
use std::io;


fn imprimir_tabuada(numero: i32, limite_inferior: i32, limite_superior: i32) {
    println!("\nTabuada do {} de {} até {}:", numero, limite_inferior, limite_superior);

    for i in limite_inferior..=limite_superior {
        println!("{} x {} = {}", numero, i, numero * i);
    }
}

fn main() {
    let mut entrada = String::new();


    println!("Digite o número da tabuada:");
    io::stdin().read_line(&mut entrada).expect("Erro ao ler entrada");
    let numero: i32 = entrada.trim().parse().expect("Digite um número válido");
    entrada.clear();


    println!("Digite o limite inferior:");
    io::stdin().read_line(&mut entrada).expect("Erro ao ler entrada");
    let limite_inferior: i32 = entrada.trim().parse().expect("Digite um número válido");
    entrada.clear();


    println!("Digite o limite superior:");
    io::stdin().read_line(&mut entrada).expect("Erro ao ler entrada");
    let limite_superior: i32 = entrada.trim().parse().expect("Digite um número válido");


    imprimir_tabuada(numero, limite_inferior, limite_superior);
}
---------------------------------------------------------------------------------------------------------------
//Questão 4
fn calcular_media(nota1: f64, nota2: f64, nota3: f64) -> f64 {
    let peso1 = 2.0;
    let peso2 = 3.0;
    let peso3 = 5.0;
    let soma_pesos = peso1 + peso2 + peso3;

    (nota1 * peso1 + nota2 * peso2 + nota3 * peso3) / soma_pesos
}

fn main() {

    let nota1: f64 = 7.5;
    let nota2: f64 = 8.0;
    let nota3: f64 = 9.2;


    let media = calcular_media(nota1, nota2, nota3);

    println!("Notas: {}, {}, {}", nota1, nota2, nota3);
    println!("Média ponderada: {:.2}", media);


    if media >= 7.0 {
        println!("Aluno Aprovado!");
    } else {
        println!("Aluno Reprovado!");
    }
}
