;Fichier chargeant les cartes graphiques
(defclass $carte_graphique($composant) (
                                        ($consommation :accessor consommation :initarg :consommation :type integer)
                                        ($connectique :accessor connectique :initarg :connectique :type connectique)
                                        ($dimensions :accessor dimensions :initarg :dimensions :type integer)
                                        ($utilisations :accessor utilisations :initarg :utilisations)
                                        )
  )

(defmethod initialize-instance :after ((cg $carte_graphique) &key)
  (let ((name (gentemp "CG")))
        (set name cg)
        (push name *db_composants*)
    )
  )

(make-instance '$carte_graphique :constructeur "NVIDIA" :model "GTX 1080" :consommation 180 :connectique $PCI3 :dimensions 265 :prix 789 :utilisations '("Bureautique" "Jeux" "Montage Video" "3D" "Multimedia" "Internet"))
(make-instance '$carte_graphique :constructeur "NVIDIA" :model "GTX 1070" :consommation 140 :connectique $PCI3 :dimensions 265 :prix 500 :utilisations '("Bureautique" "Jeux" "Montage Video" "3D" "Multimedia" "Internet"))
(make-instance '$carte_graphique :constructeur "NVIDIA" :model "GTX 1060" :consommation 120 :connectique $PCI3 :dimensions 229 :prix 319 :utilisations '("Bureautique" "Jeux" "Montage Video" "3D" "Multimedia" "Internet"))
(make-instance '$carte_graphique :constructeur "NVIDIA" :model "GTX 1050" :consommation 75 :connectique $PCI3 :dimensions 127 :prix 130 :utilisations '("Bureautique" "Jeux" "Montage Video" "3D" "Multimedia" "Internet"))
(make-instance '$carte_graphique :constructeur "NVIDIA" :model "Titan X" :consommation 250 :connectique $PCI3 :dimensions 254 :prix 1299 :utilisations '("Bureautique" "Jeux" "Montage Video" "3D" "Multimedia" "Internet"))
(make-instance '$carte_graphique :constructeur "NVIDIA" :model "210" :consommation 10 :connectique $PCI2 :dimensions 157 :prix 27 :utilisations '("Bureautique" "Multimedia" "Internet"))
(make-instance '$carte_graphique :constructeur "NVIDIA" :model "GT 710" :consommation 20 :connectique $PCI2 :dimensions 145 :prix 40 :utilisations '("Bureautique" "Jeux" "Multimedia" "Internet"))
(make-instance '$carte_graphique :constructeur "NVIDIA" :model "GT 750 Ti" :consommation 60 :connectique $PCI3 :dimensions 145 :prix 120 :utilisations '("Bureautique" "Jeux" "Multimedia" "3D" "Internet"))
