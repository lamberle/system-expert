;Fichier chargeant les processeurs
(defclass $processeur($composant) (
                                   ($consommation :accessor consommation :initarg :consommation :type integer)
                                   ($socket :accessor socket :initarg :socket :type string)
                                   ($nbCoeurs :accessor nbCoeurs :initarg :nbCoeurs :type integer)
                                   ($frequence :accessor frequence :initarg :frequence :type float)
                                   ($utilisations :accessor utilisations :initarg :utilisations)
                                   )
  )

(defmethod initialize-instance :after ((proc $processeur) &key)
  (let ((name (gentemp "PROC")))
        (set name proc)
        (push name *db_composants*)
    )
  )

(make-instance '$processeur :constructeur "Intel" :model "i5-6600K" :prix 273 :socket "LGA 1151" :nbCoeurs 4 :frequence 3.5 :consommation 74 :utilisations '("Bureautique" "Jeux" "Montage Video" "3D" "Multimedia" "Internet"))
(make-instance '$processeur :constructeur "Intel" :model "i7-6700K" :prix 390 :socket "LGA 1151" :nbCoeurs 4 :frequence 4 :consommation 100 :utilisations '("Bureautique" "Jeux" "Montage Video" "3D" "Multimedia" "Internet"))
(make-instance '$processeur :constructeur "Intel" :model "i5-7600K" :prix 285 :socket "LGA 1151" :nbCoeurs 4 :frequence 3.8 :consommation 62 :utilisations '("Bureautique" "Jeux" "Montage Video" "3D" "Multimedia" "Internet"))
(make-instance '$processeur :constructeur "Intel" :model "i7-6900K" :prix 1190 :socket "2011-V3" :nbCoeurs 8 :frequence 3.2 :consommation 140 :utilisations '("Bureautique" "Jeux" "Montage Video" "3D" "Multimedia" "Internet"))
(make-instance '$processeur :constructeur "Intel" :model "i7-6850K" :prix 690 :socket "2011-V3" :nbCoeurs 8 :frequence 3.6 :consommation 70 :utilisations '("Bureautique" "Jeux" "Montage Video" "3D" "Multimedia" "Internet"))
(make-instance '$processeur :constructeur "Intel" :model "i7-7700K" :prix 690 :socket "LGA 1151" :nbCoeurs 4 :frequence 4.2 :consommation 162 :utilisations '("Bureautique" "Jeux" "Montage Video" "3D" "Multimedia" "Internet"))
(make-instance '$processeur :constructeur "Intel" :model "i3-6100" :prix 130 :socket "LGA 1151" :nbCoeurs 2 :frequence 3.7 :consommation 54 :utilisations '("Bureautique" "Multimedia" "Internet"))
