% ============================================================
%   PROGENITORES
% ============================================================

progenitor(urano, cronos).
progenitor(gaia, cronos).

progenitor(urano, oceano).
progenitor(gaia, oceano).

progenitor(cronos, zeus).
progenitor(reia, zeus).

progenitor(cronos, poseidon).
progenitor(reia, poseidon).

progenitor(cronos, hades).
progenitor(reia, hades).

progenitor(zeus, atena).

progenitor(zeus, apolo).
progenitor(hera, apolo).

progenitor(zeus, artemis).
progenitor(leto, artemis).

progenitor(zeus, ares).
progenitor(hera, ares).

progenitor(zeus, hefesto).
progenitor(hera, hefesto).

progenitor(poseidon, tritao).

progenitor(zeus, perseu).
progenitor(danae, perseu).

progenitor(atena, erictonio).

% ============================================================
%   DOMÍNIOS
% ============================================================

dominio(zeus, ceu).
dominio(zeus, trovão).

dominio(poseidon, mar).
dominio(poseidon, terremoto).

dominio(hades, submundo).

dominio(atena, sabedoria).
dominio(atena, guerra_estrategica).

dominio(ares, guerra_brutal).

dominio(apolo, sol).
dominio(apolo, musica).

dominio(artemis, caça).
dominio(artemis, lua).

dominio(hefesto, fogo).
dominio(hefesto, forja).

dominio(afrodite, beleza).
dominio(afrodite, amor).

dominio(cronos, tempo).

% ============================================================
%   ARMAS
% ============================================================

arma(zeus, raio).
arma(poseidon, tridente).
arma(hades, elmo_escuridao).
arma(atena, escudo_aegis).
arma(perseu, espada_adamantina).

% ============================================================
%   CARACTERÍSTICAS
% ============================================================

caracteristica(zeus, rei).
caracteristica(hera, rainha).
caracteristica(hades, invisivel).
caracteristica(hefesto, ferreiro).
caracteristica(artemis, virgem).
caracteristica(perseu, mortal).

% ============================================================
%   ALIANÇAS
% ============================================================

aliado(zeus, poseidon).
aliado(poseidon, zeus).

aliado(atena, apolo).
aliado(apolo, atena).

aliado(ares, hades).
aliado(hades, ares).

aliado(hefesto, atena).
aliado(atena, hefesto).

% ============================================================
%   LOCAIS PRINCIPAIS
% ============================================================

local_principal(zeus, olimpo).
local_principal(poseidon, atlantida).
local_principal(hades, submundo).
local_principal(apolo, olimpo).
local_principal(artemis, florestas).

% ============================================================
%   REGRA: Divindade Olímpica
% ============================================================

divindade_olimpica(Deus) :-
    progenitor(cronos, Deus),
    dominio(Deus, Dominio),
    ( Dominio = ceu
    ; Dominio = mar
    ; Dominio = submundo
    ).

% ============================================================
%   REGRA AUXILIAR: Quantidade de domínios
% ============================================================

quantidade_dominios(Deus, Qtd) :-
    findall(D, dominio(Deus, D), Lista),
    length(Lista, Qtd).

% ============================================================
%   REGRA: Deus Maior
% ============================================================

deus_maior(Deus) :-
    quantidade_dominios(Deus, Qtd),
    Qtd >= 2,
    local_principal(Deus, olimpo).

% ============================================================
%   REGRA: Irmãos Germanos
% ============================================================

irmaos_germanos(A, B) :-
    progenitor(P, A),
    progenitor(P, B),
    progenitor(M, A),
    progenitor(M, B),
    A \= B.

% ============================================================
%   REGRA: Ancestralidade
% ============================================================

ancestral(A, D) :-
    progenitor(A, D).

ancestral(A, D) :-
    progenitor(A, Z),
    ancestral(Z, D).
