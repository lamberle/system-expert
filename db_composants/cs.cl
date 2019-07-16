;Fichier chargeant les cartes son
(defclass $carte_son($composant) (
                                  )
  )

(defmethod initialize-instance :after ((cs $carte_son) &key)
  (let ((name (gentemp "CS")))
        (set name cs)
        (push name *db_composants*)
    )
  )

(make-instance '$carte_son :constructeur "Asus" :model "Strix Raid Pro" :prix 166)
(make-instance '$carte_son :constructeur "Asus" :model "Xonar DGX" :prix 40)
(make-instance '$carte_son :constructeur "Asus" :model "Xonar DX" :prix 80)