(setq R1 '(cg ((match_price (eval composant) budget) (match_use (eval composant) utilisations)) (ajouter-fait (list 'cg composant))))
(setq R2 '(proc ((match_price (eval composant) budget) (match_use (eval composant) utilisations)) (ajouter-fait (list 'proc composant))))

(setq R11 '(((eq (list-length (assoc 'proc *BF*)) 2) (eq (list-length (assoc 'cg *BF*)) 2)) (ajouter-fait '(consommation (eval (get_fait 'CG *BF*))))))

