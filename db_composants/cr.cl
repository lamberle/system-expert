;Fichier chargeant les cartes réseaux
(defclass $carte_reseau($composant) (
                                     ($wifi :accessor wifi :initarg :wifi :type boolean)
                                    )
  )

(defmethod initialize-instance :after ((cr $carte_reseau) &key)
  (let ((name (gentemp "CR")))
        (set name cr)
        (push name *db_composants*)
    )
  )

(make-instance '$carte_reseau :constructeur "D-Link" :model "DGE-528T" :prix 13 :wifi NIL)
(make-instance '$carte_reseau :constructeur "Tp-Link" :model "TG-3468" :prix 11 :wifi NIL)
(make-instance '$carte_reseau :constructeur "Tp-Link" :model "TG-3269" :prix 10 :wifi NIL)
(make-instance '$carte_reseau :constructeur "Tp-Link" :model "Archer T8E" :prix 58 :wifi T)
(make-instance '$carte_reseau :constructeur "Gigabyte" :model "GC-WB867D-I" :prix 35 :wifi T)
(make-instance '$carte_reseau :constructeur "Asus" :model "PCE-N10" :prix 18 :wifi T)