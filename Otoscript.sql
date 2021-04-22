CREATE DATABASE IF NOT EXISTS oto;
USE oto;


CREATE TABLE VEHICULES (
    id_vehicule INT(10) NOT NULL AUTO_INCREMENT,
    etat_vehicule BOOLEAN NOT NULL,
    type_vehicule BOOLEAN NOT NULL,
    prix_vehicule DECIMAL(10,2),
    marque_vehicule VARCHAR(50),
    modele_vehicule VARCHAR(50)
    ,CONSTRAINT VEHICULES_PK PRIMARY KEY (id_vehicule)
);

CREATE TABLE ACCESSOIRES (
    id_accessoire INT(10) NOT NULL AUTO_INCREMENT,
    nom_accessoire VARCHAR(50),
    prix_accessoire DECIMAL(10,2)
    ,CONSTRAINT ACCESSOIRE_PK PRIMARY KEY (id_accessoire)
);

CREATE TABLE OPTIONS (
    id_option INT(10) NOT NULL AUTO_INCREMENT,
    nom_option VARCHAR(50),
    prix_option DECIMAL(10,2)
    ,CONSTRAINT OPTIONS_PK PRIMARY KEY (id_option)
);

CREATE TABLE COMMERCIAUX (
    id_commercial INT(10) NOT NULL AUTO_INCREMENT,
    nom_commercial VARCHAR(50),
    type_commercial BOOLEAN NOT NULL
    ,CONSTRAINT COMMERCIAUX_PK PRIMARY KEY (id_commercial)
);

CREATE TABLE CLIENTS (
    id_client INT(10) NOT NULL AUTO_INCREMENT,
    client_type BOOLEAN NOT NULL,
    nom_client VARCHAR(50),
    id_commercial INT(10)
    ,CONSTRAINT CLIENTS_PK PRIMARY KEY (id_client)
    ,CONSTRAINT CLIENTS_COMMERCIAUX_FK FOREIGN KEY (id_commercial) REFERENCES COMMERCIAUX(id_commercial)
);

CREATE TABLE COMMANDES (
    id_commande INT(10) NOT NULL,
    date_commande DATETIME
    ,CONSTRAINT COMMANDES_PK PRIMARY KEY (id_commande)
);

CREATE TABLE ACHETER (
    id_accessoire INT(10),
    id_option INT(10) ,
    id_client INT(10) 
    ,CONSTRAINT ACHETER_PK PRIMARY KEY (id_accessoire, id_option, id_client)
    ,CONSTRAINT ACHETER_ACCESSOIRES_FK FOREIGN KEY (id_accessoire) REFERENCES ACCESSOIRES(id_accessoire)
    ,CONSTRAINT ACHETER_OPTIONS_FK FOREIGN KEY (id_option) REFERENCES OPTIONS(id_option)
    ,CONSTRAINT ACHETER_CLIENTS_FK FOREIGN KEY (id_client) REFERENCES CLIENTS(id_client)
);

CREATE TABLE POSER (
    id_accessoire INT(10),
    id_option INT(10),
    id_commande INT(10) 
    ,CONSTRAINT POSER_PK PRIMARY KEY (id_accessoire, id_option, id_commande)
    ,CONSTRAINT POSER_ACCESSOIRES_FK FOREIGN KEY (id_accessoire) REFERENCES ACCESSOIRES(id_accessoire)
    ,CONSTRAINT POSER_OPTIONS_FK FOREIGN KEY (id_option) REFERENCES OPTIONS(id_option)
    ,CONSTRAINT POSER_COMMANDES_FK FOREIGN KEY (id_commande) REFERENCES COMMANDES(id_commande)
);

CREATE TABLE PAYER (
    id_vehicule INT(10),
    id_commande INT(10)
    ,CONSTRAINT PAYER_PK PRIMARY KEY (id_vehicule, id_commande)
    ,CONSTRAINT PAYER_VEHICULES_FK FOREIGN KEY (id_vehicule) REFERENCES VEHICULES(id_vehicule)
    ,CONSTRAINT PAYER_COMMANDES_FK FOREIGN KEY (id_commande) REFERENCES COMMANDES(id_commande)
);

CREATE TABLE REPARER (
    id_vehicule INT(10),
    id_commande INT(10)
    ,CONSTRAINT REPARER_PK PRIMARY KEY (id_vehicule, id_commande)
    ,CONSTRAINT REPARER_VEHICULES_FK FOREIGN KEY (id_vehicule) REFERENCES VEHICULES(id_vehicule)
    ,CONSTRAINT REPARER_COMMANDES_FK FOREIGN KEY (id_commande) REFERENCES COMMANDES(id_commande)
);

CREATE TABLE ENTRETENIR (
    id_vehicule INT(10),
    id_commande INT(10)
    ,CONSTRAINT ENTRETENIR_PK PRIMARY KEY (id_vehicule, id_commande)
    ,CONSTRAINT ENTRETENIR_VEHICULES_FK FOREIGN KEY (id_vehicule) REFERENCES VEHICULES(id_vehicule)
    ,CONSTRAINT ENTRETENIR_COMMANDES_FK FOREIGN KEY (id_commande) REFERENCES COMMANDES(id_commande)
);

CREATE TABLE COMMANDER (
    id_client INT(10),
    id_commande INT(10)
    ,CONSTRAINT COMMANDER_PK PRIMARY KEY (id_client, id_commande)
    ,CONSTRAINT COMMANDER_CLIENTS_FK FOREIGN KEY (id_client) REFERENCES CLIENTS(id_client)
    ,CONSTRAINT COMMANDER_COMMANDES_FK FOREIGN KEY (id_commande) REFERENCES COMMANDES(id_commande)
);