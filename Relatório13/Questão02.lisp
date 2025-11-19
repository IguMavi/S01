;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 1. Estrutura da criatura
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defstruct criatura
  nome
  ambiente
  periculosidade
  vida-media)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 2. Catálogo inicial com 4 criaturas
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *catalogo*
  (list
   ;; Peixe das Safe Shallows
   (make-criatura
    :nome "Peeper"
    :ambiente "Safe Shallows"
    :periculosidade "Baixa"
    :vida-media 6)

   ;; Reaper Leviathan
   (make-criatura
    :nome "Reaper Leviathan"
    :ambiente "Open Ocean"
    :periculosidade "Alta"
    :vida-media 50)

   ;; Criatura Deep 1
   (make-criatura
    :nome "Crabsquid"
    :ambiente "Deep"
    :periculosidade "Média"
    :vida-media 30)

   ;; Criatura Deep 2
   (make-criatura
    :nome "Ghost Leviathan Juvenile"
    :ambiente "Deep"
    :periculosidade "Alta"
    :vida-media 80)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 3. HOF: filtra criaturas perigosas (não "Baixa")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun filtra-por-perigo (catalogo)
  "Retorna apenas criaturas cuja periculosidade NÃO seja 'Baixa'."
  (remove-if (lambda (c)
               (string-equal (criatura-periculosidade c) "Baixa"))
             catalogo))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 4. Mapeamento: relatório das criaturas do ambiente Deep
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun relatorio-profundidade (catalogo)
  "Retorna lista de strings no formato:
   \"NOME: Vive em AMBIENTE\" apenas para criaturas do ambiente 'Deep'."
  (let ((somente-deep
          (remove-if-not (lambda (c)
                           (string-equal (criatura-ambiente c) "Deep"))
                         catalogo)))
    (mapcar (lambda (c)
              (format nil "~a: Vive em ~a"
                      (criatura-nome c)
                      (criatura-ambiente c)))
            somente-deep)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 5. Exemplos de Teste
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun testar ()
  (format t "~%=== Criaturas Perigosas (não Baixa) ===~%")
  (dolist (c (filtra-por-perigo *catalogo*))
    (format t "~a (~a)~%"
            (criatura-nome c)
            (criatura-periculosidade c)))

  (format t "~%=== Relatório Criaturas Deep ===~%")
  (dolist (linha (relatorio-profundidade *catalogo*))
    (format t "~a~%" linha)))
