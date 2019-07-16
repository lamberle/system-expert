;;Fichier chargeant les DBs de tous les composants.

(setq *db_composants* NIL)


;Classes basiques
(defclass $connectique() (
                          ($nom_connectique :accessor nom_connectique :initarg :nom_connectique :type string)
                          )
  )

(defclass $composant() (
                        ($constructeur :accessor constructeur :initarg :constructeur :type string)
                        ($model :accessor model :initarg :model :type string)
                        ($prix :accessor prix :initarg :prix :type integer)
                        )
  )

(setq $PCI2 (make-instance '$connectique :nom_connectique "PCI2"))
(setq $PCI3 (make-instance '$connectique :nom_connectique "PCI3"))

(setq $DDR3 (make-instance '$connectique :nom_connectique "DDR3"))
(setq $DDR4 (make-instance '$connectique :nom_connectique "DDR4"))


;Chargement des differents fichiers
(load "db_composants/cg.cl")
(load "db_composants/proc.cl")
(load "db_composants/cm.cl")
(load "db_composants/alim.cl")
(load "db_composants/cs.cl")
(load "db_composants/ram.cl")
(load "db_composants/dd.cl")
(load "db_composants/boitier.cl")
(load "db_composants/cr.cl")
