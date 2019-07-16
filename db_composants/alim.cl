;Fichier chargeant les alimentations
(defclass $alimentation($composant) (
                                ($puissance :accessor $puissance :initarg :puissance :type integer)
                                )
  )

(defmethod initialize-instance :after ((alim $alimentation) &key)
  (let ((name (gentemp "ALIM")))
        (set name alim)
        (push name *db_composants*)
    )
  )

(make-instance '$alimentation :constructeur "Fortron" :model "Hexa+" :prix 43 :puissance 500)
(make-instance '$alimentation :constructeur "Cooler Master" :model "G750M" :prix 90 :puissance 750)
(make-instance '$alimentation :constructeur "EVGA" :model "EVGA 600W" :prix 55 :puissance 600)
(make-instance '$alimentation :constructeur "EVGA" :model "EVGA 850 BQ" :prix 110 :puissance 850)
(make-instance '$alimentation :constructeur "Corsair" :model "VS350" :prix 40 :puissance 350)