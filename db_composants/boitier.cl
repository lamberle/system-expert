;Fichier chargeant les boitiers
(defclass $boitier($composant) (
                                ($typeCM :accessor $typeCM :initarg :typeCM :type string)
                                ($dimensionsCG :accessor dimensionsCG :initarg :dimensionsCG :type integer)
                                )
  )

(defmethod initialize-instance :after ((boitier $boitier) &key)
  (let ((name (gentemp "BOITIER")))
        (set name boitier)
        (push name *db_composants*)
    )
  )

(make-instance '$boitier :constructeur "Zalman" :model "H1" :prix 133 :typeCm "E-ATX" :dimensionsCG 360)
(make-instance '$boitier :constructeur "Kolink" :model "Vault" :prix 50 :typeCm "E-ATX" :dimensionsCG 400)
(make-instance '$boitier :constructeur "EVGA" :model "DG-87" :prix 250 :typeCm "E-ATX" :dimensionsCG 420)
(make-instance '$boitier :constructeur "BitFenix" :model "Nova" :prix 35 :typeCm "m-ATX" :dimensionsCG 320)
(make-instance '$boitier :constructeur "Zalman" :model "Z11Plus HF1" :prix 70 :typeCm "m-ATX" :dimensionsCG 290)
(make-instance '$boitier :constructeur "Cooler Master" :model "Master Case Pro 5" :prix 150 :typeCm "m-ATX" :dimensionsCG 400)
(make-instance '$boitier :constructeur "Zalman" :model "R1" :prix 50 :typeCm "ATX" :dimensionsCG 360)
(make-instance '$boitier :constructeur "Cooler Master" :model "Cosmos SE" :prix 160 :typeCm "ATX" :dimensionsCG 400)
(make-instance '$boitier :constructeur "Phanteks" :model "Eclipse P400" :prix 85 :typeCm "ATX" :dimensionsCG 400)