;Fichier chargeant les disques durs
(defclass $disque_dur($composant) (
                                   )
  )

(defmethod initialize-instance :after ((dd $disque_dur) &key)
  (let ((name (gentemp "DD")))
        (set name dd)
        (push name *db_composants*)
    )
  )

(make-instance '$disque_dur :constructeur "Seagate" :model "Barracuda 1To" :prix 60)
(make-instance '$disque_dur :constructeur "Seagate" :model "IronWolf 6To" :prix 260)
(make-instance '$disque_dur :constructeur "Western Digital" :model "WD Red 2 To" :prix 100)