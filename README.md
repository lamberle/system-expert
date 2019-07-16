# system-expert

Réalisation d'un système expert en LISP (avec Allegro Common Lisp).


Trouver les composants adéquats pour créer sa configuration de PC peut être une tâche délicate pour les non-initiés, c’est pourquoi nous avons décidé de créer un assistant pour générer automatiquement une liste de composants en fonction de vos besoins.

	Pour répondre à ce problème nous avons choisis d’utiliser la représentation objet du LISP pour représenter nos différents composants.
Ainsi nous avons créée une classe par composant comme par exemple pour la carte mère :

(defclass $carte_mere($composant) (




                                  ($typeCM :accessor typeCM :initarg :typeCM :type string)


                                  ($connectiqueProc :accessor connectiqueProc :initarg :connectiqueProc :type string)


                                  ($connectiqueRAM :accessor connectiqueRAM :initarg :connectiqueRAM :type connectique)


                                  ($nbRAM :accessor nbRAM :initarg :nbRAM :type integer)


                                  ($connectiqueExt :accessor connectiqueExt :initarg :connectiqueExt :type connectique)


                                  ($nbExt :accessor nbExt :initarg :nbExt :type integer)


                                  ($utilisations :accessor utilisations :initarg :utilisations)


                                  )


 )



Tous les composants héritent de la classe “composant” qui contient les attributs constructeur (fabricant du composant), model et prix puisque ce sont des propriétés que tous les composants doivent avoir.
Pour la carte mère on peut par exemple voir qu’on a les attributs typeCM, connectiqueProc, connectique RAM, ou nbRam qui nous permettront plus tard de tester la compatibilité de la carte mère avec les autres composants. On a également l’attribut utilisations qui nous permettra de déterminer si la carte mère correspond à l’utilisation que l’utilisateur aura avec son PC.

Nous avons également ajouté à chacune de ces classes une méthode qui se déclenche lors de l’instanciation et qui ajoute la nouvelle instance dans notre base de composants :

(defmethod initialize-instance :after ((cm $carte_mere) &key)




 (let ((name (gentemp "CM")))


       (set name cm)


       (push name *db_composants*)


   )


 )




Nous utilisons un gentemp avec l’abréviation du type de composant pour nommer nos nouveaux composants.

Ensuite nous avons créée un ensemble suffisants d’instance de composants pour avoir des résultats réalistes.
Par exemple la Carte Graphique haut de gamme de NVIDIA :

(make-instance '$carte_graphique :constructeur "NVIDIA" :model "GTX 1080" :consommation 180 :connectique $PCI3 :dimensions 265 :prix 789 :utilisations '("Bureautique" "Jeux" "Montage Video" "3D" "Multimedia" "Internet"))

Représentation des connaissances :
Notre Base de Faits est représenté sous la forme d’une liste de fait :
(fait1 fait2 fait3 …) et chaque fait est un couple clé valeur (clé valeur).
Par exemple la Base de Fait avant l’exécution pourrait être :

((budget 1000) (utilisations (“Multimedia” “Bureautique”)))

De même notre Base de faits est représenté sous la forme d’une liste de règle:
(regle1 regle2 regle3 …)

et une règle est de la forme :
(type_de_composant conditions action)

Une règle ne s’applique qu'à un seul type de composant, d’où la nécessité de le spécifier dans la règle.
Un exemple de règle présent dans notre base de règle :
(setq R1 '(cg ((match_price (eval composant) budget) (match_use (eval composant) utilisations)) (ajouter-fait (list 'cg composant))))

Cette règle s’applique donc aux Cartes Graphiques, elle vérifie que la CG corresponde au budget total (match_price est une fonction qui définit quels critères doit respecter le prix d’un composant pour être en accord avec le budget total) et qu’elle corresponde aux utilisations (Bureautique, multimédia etc) de l’utilisateurs, si la CG respecte ces critères alors un nouveau fait “CG” dans la base fait avec comme valeur l’instance de la carte graphique correspondante.

Fonctions de services :
Pour simplifier le code nous avons créée un grand nombre de  fonctions de services :
-Des fonctions pour manipuler la base de fait get_fait, ajouter-fait, modifier-fait
-Des fonctions pour manipuler les règles check-condition, check-rule, appliquer-regle
-Des fonctions qui vérifient que les composants respectent certaines conditions match_price, matach_use, match_connectique_proc …
Et d’autres fonctions comme config-termine qui détermine si une config est complète ou get_class_name qui retourne le nom complet de la classe correspondant à l’abréviation (ex : cg => $carte_graphique) 

Chainage avant :
Nous avons choisis d’utiliser un chainage avant.

Notre fonction de chaînage avant prend en paramètres la base de fait, la base de règle, la liste des règles déjà utilisées et aussi notre base de composants.
L’algorithme parcourt l’ensemble des règles de notre Base de Règle, si la règle n’a pas déjà été utilisé, on vérifie si on a déjà des composants du type spécifié par la règle dans notre base de fait, si c’est le cas on applique la règle à tous ces composants, sinon à tous les composants de ce type présent dans notre base de composants, si la règle est applicable à un des composants elle est ajouté à la liste des règles utilisées.


Notre fonction principale run appel notre chaînage avant jusqu’à atteindre une des conditions d’arrêts qui sont :
-Une config complète a été trouvée
-Toutes les règles ont déjà été utilisées
-Aucune règle n’a été utilisé pendant l’itération

Profondeur du système :
Nous avons choisis de faire notre algorithme en profondeur d'abord puisque nous désirons trouver une seule solution qui n’est pas forcément la solution la plus courte.
Avec les règles actuellement présentes dans notre base de règle nous avons une profondeur de 3 puisque pour trouver un boitier nous avons besoin de connaître le format de la carte mère, pour trouver la carte mère nous avons besoin de connaitre le socket du processeur et pour trouver le processeur il faut connaître le budget de l’utilisateurs et ses utilisations.
Notre base de règles contient les 10 règles suivantes :



Pour la plupart des composants nous n’avons qu’une seule règle mais on pourrait imaginer d’autres règles complémentaire, comme un règle privilégiant les boîtiers de petites tailles si l’utilisateur l’a spécifié, et donc avec d’autre règles en chaîne éliminer les carte mère qui sont également trop grandes, de même pour les cartes graphiques etc.
Notre approche orienté objet permet de limiter grandement le nombre de règle puisque nous avons une seule règle par type de composant et non pas par composant, notre base de composant contient actuellement une soixantaine de composants, sans cette approche c’était autant de règles qu’il aurait fallu implémenter.
Notre base de composants étant très complète puisque les classes des composants prennent en charge la plupart des caractéristiques des composants (la taille, le prix, les critères de compatibilité, les utilisations pour lesquelles ils sont adéquats etc.) il est facile d’imaginer toute un ensemble de règles plus fines pour correspondre au plus près aux besoins de l’utilisateur, nous avons par exemple ajouté la possibilité de spécifier si l’utilisateur utilise le wifi ou un câble ethernet en ajoutant des règles qui choisissent la carte réseau en conséquence.
