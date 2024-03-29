;;Retourne la valeur d'un fait
;;(get_fait 'budget *BF*)
;;>1000
(defun get_fait (fait BF) 
  (cadr (assoc fait *BF*))
  )
 ;;ajoute un fait a la base
 ;;(ajouter-fait '(processeur 'i36600))
(defun ajouter-fait (fait)  
  (if (assoc (car fait) *BF*)
      (modifier-fait (car fait) (cadr fait))
    (push fait *BF*)))
 
;;modifie la valeur d'un fait
;;(modifier-fait 'budget 700)
(defun modifier-fait (fait valeur)
  (if (not (member valeur (assoc fait *BF*) :test #'equal))
      (let ((pos (position (assoc fait *BF*) *BF*)))
        (setf pos (nconc (assoc fait *BF*) (list valeur)))
        )
    )             
  )

  ;;Verifie une condition d'une regle
(defun check-condition (cond BF composant)
  (let ((resultat))
    (if (symbolp (second cond))
        (set (second cond) (get_fait (second cond) BF))
      )
    (if (and (third cond) (symbolp (third cond)))
        (set (third cond) (get_fait (third cond) BF))
      )
    (setq resultat (eval cond))
    (if (symbolp (second cond))
        (makunbound (second cond))
      )
    (if (and (third cond) (symbolp (third cond)))
        (makunbound (third cond))
      )
    resultat
    )
  )
  
  ;;effectue l'action d'une regle
(defun appliquer-regle (regle composant)
  (declare (special composant))
  (if (check-rule regle composant)
      (eval (cadr regle))
    ))

(defun check-rule(rule composant)
  (let ((result T))
    (dolist (x (car rule) result)
      (setq result (and (check-condition x *BF* composant) result))
      )
    )
  )

(defun config-termine (BF) 
  (equal 18 (+ (list-length (assoc 'cm BF)) 
     (+ (list-length (assoc 'cg BF)) 
        (+ (list-length (assoc 'cr BF)) 
           (+ (list-length (assoc 'cs BF)) 
              (+ (list-length (assoc 'dd BF)) 
                 (+ (list-length (assoc 'boitier BF)) 
                    (+ (list-length (assoc 'ram BF)) 
                       (+ (list-length (assoc 'alim BF)) (list-length (assoc 'proc BF)))))))))))
  )

(defun match_use(composant use)
  (let ((temp T))
    (dolist (x use temp)
      (setq temp (and temp (member x (utilisations composant) :test #'equal)))
      )
    )
  )
(defun match_price (composant budget) 
                   (let ((ratio))
                     (cond ((eq (type-of composant) '$CARTE_GRAPHIQUE) (setq ratio 0.3))
                     ((eq (type-of composant) '$CARTE_RESEAU) (setq ratio 0.05))
                     ((eq (type-of composant) '$CARTE_SON) (setq ratio 0.05))
                     ((eq (type-of composant) '$CARTE_MERE) (setq ratio 0.15))
                     ((eq (type-of composant) '$DISQUE_DUR) (setq ratio 0.1))
                     ((eq (type-of composant) '$BOITIER) (setq ratio 0.1))
                     ((eq (type-of composant) '$RAM) (setq ratio 0.07))
                     ((eq (type-of composant) '$ALIMENTATION) (setq ratio 0.1))
                    ((eq (type-of composant) '$PROCESSEUR) (setq ratio 0.3)))
                     (< (prix composant) (* ratio budget))))


(defun match-conectique-proc (cm proc) (
                                                         equal (connectiqueProc cm) (socket proc)))

(defun get_class_name(x)
  (let ((result))
    (cond ((equal x 'cg) (setq result '$carte_graphique))
          ((equal x 'cr) (setq result '$carte_reseau))
          ((equal x 'cs) (setq result '$carte_son))
          ((equal x 'cm) (setq result '$carte_mere))
          ((equal x 'dd) (setq result '$disque_dur))
          ((equal x 'boitier) (setq result '$boitier))
          ((equal x 'ram) (setq result '$ram))
          ((equal x 'alim) (setq result '$alimentation))
          ((equal x 'proc) (setq result '$processeur))
          )
    )
  )
    
(defun same_elements(list1 list2)
  (let ((temp T))
    (dolist (x list1 temp)
      (setq temp (and (member x list2 :test #'equal)))
      )
    (dolist (x list2 temp)
        (setq temp (and (member x list1 :test #'equal)))
      )
    )
  )

(defun chainage-avant (BF BR DB explored_rules) 
  (if (or (same_elements explored_rules BR) (config-termine BF)) NIL 
    (loop
      for regle in BR
      do
      (if (not (member regle  explored_rules :test #'equal))
          (if (eq (list-length (assoc (car (eval regle)) BF)) 1)
              (progn 
                (dolist (composant DB)
                  (if (equal (type-of (eval composant)) (get_class_name (car (eval regle))))
                      (appliquer-regle (cdr (eval regle)) composant))
                  )
                (return regle)
                )
            (if (not (eq (list-length (assoc (car (eval regle)) BF)) 2))
                (let ((old_value (cdr (assoc (car (eval regle)) BF))) (pos (position (assoc (car (eval regle)) *BF*) *BF*)))
                  (setf pos (list (car (eval regle))))
                  (dolist (composant old_value)
                    (appliquer-regle (cdr (eval regle)) composant))
                  (return regle)
                  )
              )
            )
        )
      )
    )
  )
