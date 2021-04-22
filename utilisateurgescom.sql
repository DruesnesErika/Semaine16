-- Créez trois utilisateurs util1, util2, util3
-- util1 doit pouvoir effectuer toutes les actions
-- util2 ne peut que sélectionner les informations dans la base
-- util3 n'a aucun droit sur la base de données, sauf d'afficher la table suppliers

CREATE USER 'util1'@'%';

CREATE USER 'util2'@'%';

CREATE USER 'util3'@'%';


GRANT ALL PRIVILEGES ON afpa_gescom.* TO 'util1'@'%';

GRANT SELECT ON afpa_gescom.* TO 'util2'@'%';

GRANT SELECT ON afpa_gescom.suppliers TO 'util3'@'%';