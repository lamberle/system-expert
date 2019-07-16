(load "db_composants/db_composants.cl")
(load "tools.cl")
(load "regles.cl")

(defparameter *BF* '((budget 1000) (utilisations ("Jeux")) (cg) (cr) (cm) (cs) (dd) (boitier) (alim) (proc) (ram)))

;;Moteur et point de d�part du syst�me
(defun run(BF BR DB)
  (let ((explored_rules NIL) (current NIL) (previous NIL))
    (loop
      (setq current (chainage-avant BF BR DB explored_rules))
      (push current explored_rules)
      (if (not current)
          (return)
        )
      )
    (if (config-termine BF)
        (progn
          (format t "Config trouve :")
          (format t "Processeur ~S~% ~S~% :" (constructeur (cadr (assoc 'proc BF))) (model (cadr (assoc 'proc BF))))
          (format t "Carte mere ~S~% ~S~% :" (constructeur (cadr (assoc 'cm BF))) (model (cadr (assoc 'cm BF))))
          (format t "Carte graphique ~S~% ~S~% :" (constructeur (cadr (assoc 'cg BF))) (model (cadr (assoc 'cg BF))))
          (format t "Carte son ~S~% ~S~% :" (constructeur (cadr (assoc 'cs BF))) (model (cadr (assoc 'cs BF))))
          (format t "Carte reseau ~S~% ~S~% :" (constructeur (cadr (assoc 'cr BF))) (model (cadr (assoc 'cr BF))))
          (format t "RAM ~S~% ~S~% :" (constructeur (cadr (assoc 'ram BF))) (model (cadr (assoc 'ram BF))))
          (format t "Almentation ~S~% ~S~% :" (constructeur (cadr (assoc 'alim BF))) (model (cadr (assoc 'alim BF))))
          (format t "Disque dur ~S~% ~S~% :" (constructeur (cadr (assoc 'dd BF))) (model (cadr (assoc 'dd BF))))
          (format t "Boitier ~S~% ~S~% :" (constructeur (cadr (assoc 'boitier BF))) (model (cadr (assoc 'boitier BF))))
          )
      )
    )
  )