;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 1. Função pura: calcula-dosagem
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun calcula-dosagem (peso-kg idade-anos)
  (cond
    ((or (< idade-anos 5)
         (< peso-kg 20))
     10)
    ((and (>= idade-anos 5)
          (<= idade-anos 12)
          (>= peso-kg 20))
     25)
    (t
     50)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 2. Função pura: ajusta-preco
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun ajusta-preco (preco-base nome-da-erva)
  (cond
    ((string-equal nome-da-erva "Ginseng") (* preco-base 3.0))
    ((string-equal nome-da-erva "Lótus")   (* preco-base 1.5))
    (t preco-base)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 3. Teste: preço final para paciente de 14 anos e 60kg usando Lótus
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun teste-preco-final ()
  (let* ((dosagem (calcula-dosagem 60 14))
         (preco-final (ajusta-preco 10 "Lótus")))
    (format t "Dosagem: ~a ml~%" dosagem)
    (format t "Preço final: ~a moedas~%" preco-final)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 4. Sistema de Catálogo da Fauna – Planet 4546
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Estrutura de dados
(defstruct criatura
  nome
  habitat
  agressivo
  tamanho-metros)

;; Banco de dados simples
(defparameter *fauna-4546* '())

;; Função para adicionar criatura
(defun adicionar-criatura (nome habitat agressivo tamanho)
  (push (make-criatura
         :nome nome
         :habitat habitat
         :agressivo agressivo
         :tamanho-metros tamanho)
        *fauna-4546*))

;; Busca criatura por nome
(defun buscar-criatura (nome)
  (find nome *fauna-4546*
        :key #'criatura-nome
        :test #'string-equal))

;; Lista todas as criaturas
(defun listar-fauna ()
  (dolist (c *fauna-4546*)
    (format t "~%Nome: ~a | Habitat: ~a | Agressivo: ~a | Tamanho: ~a m"
            (criatura-nome c)
            (criatura-habitat c)
            (criatura-agressivo c)
            (criatura-tamanho-metros c))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 5. Exemplos para popular o catálogo
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun popular-fauna-exemplo ()
  (adicionar-criatura "Peeper" "Águas rasas" nil 0.3)
  (adicionar-criatura "Reaper Leviathan" "Zona do Crepúsculo" t 55)
  (adicionar-criatura "Gasopod" "Kelp Forest" nil 4)
  (format t "Fauna de exemplo adicionada!~%"))
