;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 1. Estrutura item + Catálogo Inicial
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defstruct item
  nome
  tipo          ;; "Arma", "Pocao", "Artefato"
  preco
  forca-magica)

(defparameter *catalogo*
  (list
   (make-item :nome "Lâmina Sangrenta"
              :tipo "Arma"
              :preco 200
              :forca-magica 120)

   (make-item :nome "Poção da Serpente"
              :tipo "Pocao"
              :preco 50
              :forca-magica 20)

   (make-item :nome "Orbe do Caos"
              :tipo "Artefato"
              :preco 500
              :forca-magica 200)

   (make-item :nome "Adaga Sussurrante"
              :tipo "Arma"
              :preco 150
              :forca-magica 60)))
              
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 2. Funções Puras: imposto e bônus de maldição
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun adiciona-imposto (preco)
  "Aumenta o preço em 15%."
  (* preco 1.15))

(defun bonus-maldicao (forca)
  "Aumenta força em 50% se for > 80."
  (if (> forca 80)
      (* forca 1.5)
      forca))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 3. processa-venda: filtro + transformações usando HOF
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun processa-venda (catalogo)
  "
  1. Filtra apenas 'Arma'
  2. Aumenta preço com adiciona-imposto
  3. Retorna lista de strings: \"NOME — Força: X Preço: Y\"
  "
  (let* (;; 1. Filtro
         (armas (remove-if-not (lambda (i)
                                 (string-equal (item-tipo i) "Arma"))
                               catalogo))

         ;; 2. Transformação 1: preço atualizado
         (armas-com-imposto
           (mapcar (lambda (i)
                     (make-item
                      :nome (item-nome i)
                      :tipo (item-tipo i)
                      :preco (adiciona-imposto (item-preco i))
                      :forca-magica (item-forca-magica i)))
                   armas))

         ;; 3. Transformação 2: aplicar bônus de maldição
         (relatorio
           (mapcar (lambda (i)
                     (format nil "~a — Força: ~a | Preço Final: ~a"
                             (item-nome i)
                             (bonus-maldicao (item-forca-magica i))
                             (item-preco i)))
                   armas-com-imposto)))

    relatorio))
    

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Função de teste rápida
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun testar ()
  (format t "~%=== PROCESSAMENTO DA LOJA CLANDESTINA ===~%")
  (dolist (linha (processa-venda *catalogo*))
    (format t "~a~%" linha)))
