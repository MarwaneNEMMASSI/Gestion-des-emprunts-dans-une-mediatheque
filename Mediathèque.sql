CREATE TABLE Adherent (
    id_adherent int NOT NULL AUTO_INCREMENT,
    Surnom VARCHAR (30),
    MotDePasse VARCHAR (30),
    Nom VARCHAR (30),
    Prenom VARCHAR (30),
    Adresse VARCHAR (50),
    Email VARCHAR (30),
    NumeroCIN VARCHAR (8),
    DateDeNaissance DATE,
    DateInscription TIMESTAMP,
    Score int,
    PRIMARY KEY (id_adherent)
);

CREATE TABLE Admin (
    id_admin int NOT NULL AUTO_INCREMENT,
    Prenom VARCHAR (30),
    Nom VARCHAR (30),
    Surnom VARCHAR (30),
    MotDePasse VARCHAR (30),
    PRIMARY KEY (id_admin) 
);

CREATE TABLE Ouvrage (
    id_ouvrage int NOT NULL AUTO_INCREMENT,
    titre VARCHAR (30),
    auteur VARCHAR (30),
    img VARCHAR (30),
    type VARCHAR (30),
    DateEdition DATE,
    DateAchat DATE,
    NombrePages int,
    id_admin int NOT NULL,
    FOREIGN KEY (id_admin) REFERENCES Admin (id_admin)
);

CREATE TABLE Exemplaire (
    id_exemplaire int NOT NULL AUTO_INCREMENT,
    etat VARCHAR (30),
    disponibilité VARCHAR (30),
    id_ouvrage int NOT NULL,
    FOREIGN KEY (id_ouvrage) REFERENCES Ouvrage (id_ouvrage)   
);

CREATE TABLE Reservation (
    id_reservation int NOT NULL AUTO_INCREMENT,
    DateEtHeure DATETIME,
    id_adherent int NOT NULL,
    id_admin int NOT NULL,
    id_exemplaire int NOT NULL,
    FOREIGN KEY (id_adherent) REFERENCES Adherent (id_adherent),
    FOREIGN KEY (id_admin) REFERENCES Admin (id_admin),
    FOREIGN KEY (id_exemplaire) REFERENCES Exemplaire (id_exemplaire),
    PRIMARY KEY (id_reservation)
);

CREATE TABLE Emprunt (
    id_emprunt int NOT NULL AUTO_INCREMENT,
    DateEmprunt DATETIME,
    DateRetour DATETIME,
    id_admin int NOT NULL,
    id_reservation int NOT NULL,
    FOREIGN KEY (id_admin) REFERENCES Admin (id_admin),
    FOREIGN KEY (id_reservation) REFERENCES Reservation (id_reservation),
    PRIMARY KEY (id_emprunt)
);

