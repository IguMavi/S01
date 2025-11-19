;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 1. Estrutura ocorrencia
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defstruct ocorrencia
  nome
  ritual
  nivel-medo
  agentes-enviados)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 2. Função recursiva: soma-medo-recursiva
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun soma-medo-recursiva (lista-oc)
  "Soma recursivamente os valores de nivel-medo na lista."
  (cond
    ;; lista vazia → soma 0
    ((null lista-oc) 0)

    ;; caso recursivo
    (t (+ (ocorrencia-nivel-medo (car lista-oc))
          (soma-medo-recursiva (cdr lista-oc))))))
          

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 3. Função de Alto Nível: analise-final
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun analise-final (lista-ocorrencias)
  "
  1. Calcula média do nivel-medo (usando recursão + length)
  2. Filtra ocorrências com:
       - mais de 3 agentes
       - nivel-medo acima da média
  3. Retorna lista de nomes das ocorrências críticas
  "
  (let* ((soma   (soma-medo-recursiva lista-ocorrencias))
         (quant  (length lista-ocorrencias))
         (media  (/ soma quant)))
    
    ;; filtra itens críticos
    (mapcar #'ocorrencia-nome
            (remove-if-not
             (lambda (oc)
               (and (> (ocorrencia-agentes-enviados oc) 3)
                    (> (ocorrencia-nivel-medo oc) media)))
             lista-ocorrencias))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 4. Teste Final
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defparameter *ocorrencias-teste*
  (list
   (make-ocorrencia
    :nome "Caso da Mina Abandonada"
    :ritual "Evocação"
    :nivel-medo 70
    :agentes-enviados 2)

   (make-ocorrencia
    :nome "Fenda do Cemitério Antigo"
    :ritual "Rasgo Dimensional"
    :nivel-medo 95
    :agentes-enviados 5)

   (make-ocorrencia
    :nome "Gruta dos Sussurros"
    :ritual "Invocação Menor"
    :nivel-medo 40
    :agentes-enviados 4)

   (make-ocorrencia
    :nome "Biblioteca Proibida"
    :ritual "Contrato Sombrio"
    :nivel-medo 85
    :agentes-enviados 6)

   (make-ocorrencia
    :nome "Mansão Holloway"
    :ritual "Manifestação"
    :nivel-medo 55
    :agentes-enviados 3)))

(defun testar ()
  (format t "~%=== Análise Final da Ordem ===~%")
  (format t "~a~%" (analise-final *ocorrencias-teste*)))
