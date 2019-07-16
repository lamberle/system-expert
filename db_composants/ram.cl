;Fichier chargeant les RAMs
(defclass $RAM($composant) (
                            ($consommation :accessor consommation :initarg :consommation :type integer)
                            ($typeRAM :accessor typeRAM :initarg :typeRAM :type connectique)
                            ($frequence :accessor frequence :initarg :frequence :type integer)
                            ($capacite :accessor capacite :initarg :capacite :type integer)
                            ($utilisations :accessor utilisations :initarg :utilisations)
                            )
  )

(defmethod initialize-instance :after ((ram $RAM) &key)
  (let ((name (gentemp "RAM")))
        (set name ram)
        (push name *db_composants*)
    )
  )

(make-instance '$RAM :constructeur "HyperX" :model "Fury" :typeRAM $DDR4 :capacite 4 :frequence 2133 :prix 37 :utilisations '("Bureautique" "Jeux" "Montage Video" "3D" "Multimedia" "Internet"))
(make-instance '$RAM :constructeur "Ballistix" :model "Sport LT" :typeRAM $DDR4 :capacite 8 :frequence 2400 :prix 60 :utilisations '("Bureautique" "Jeux" "Montage Video" "3D" "Multimedia" "Internet"))
(make-instance '$RAM :constructeur "Ballistix" :model "Sport LT" :typeRAM $DDR4 :capacite 4 :frequence 2400 :prix 35 :utilisations '("Bureautique" "Jeux" "Montage Video" "3D" "Multimedia" "Internet"))
(make-instance '$RAM :constructeur "Corsair" :model "Vengeance" :typeRAM $DDR4 :capacite 16 :frequence 3000 :prix 130 :utilisations '("Bureautique" "Jeux" "Montage Video" "3D" "Multimedia" "Internet"))

(make-instance '$RAM :constructeur "Kingston" :model "ValueRAM" :typeRAM $DDR3 :capacite 4 :frequence 1600 :prix 35 :utilisations '("Bureautique" "Multimedia" "Internet"))
(make-instance '$RAM :constructeur "HyperX" :model "Fury" :typeRAM $DDR3 :capacite 8 :frequence 1866 :prix 35 :utilisations '("Bureautique" "Multimedia" "Jeux" "Internet"))
(make-instance '$RAM :constructeur "HyperX" :model "Fury" :typeRAM $DDR3 :capacite 2 :frequence 1866 :prix 20 :utilisations '("Bureautique" "Multimedia" "Internet"))