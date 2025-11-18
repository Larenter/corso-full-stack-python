CREATE DATABASE tutorial;

USE tutorial;

CREATE TABLE categorie (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descrizione TEXT,
    stato VARCHAR(50) DEFAULT 'attiva'
);

CREATE TABLE IF NOT EXISTS categorie (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descrizione TEXT,
    stato VARCHAR(50) DEFAULT 'attiva'
);

INSERT INTO categorie (nome, descrizione, stato)
VALUES ('abbigliamento', 'sot cazzo', 'attiva');

SELECT * FROM categorie;

SELECT id, nome FROM categorie;

SELECT id, nome FROM categorie WHERE id = 3;

SELECT * FROM categorie WHERE nome LIKE '%abbi%';

SELECT * FROM categorie
ORDER BY id DESC;

SELECT * FROM categorie
LIMIT 20
OFFSET 40;

INSERT INTO utenti (nome, cognome, eta, data_di_nascita)
VALUES ('anna', 'simonelli', 31, '1994-11-08');

UPDATE categorie 
SET stato = 'inattiva'
WHERE id = 2;

DELETE FROM categorie 
WHERE id = 2;

select * from categorie
INNER JOIN prodotti on categorie.id = prodotti.category_id
WHERE marca = 'google';

SELECT nome, COUNT(*) AS conteggio
FROM categorie
GROUP BY nome;

CREATE TABLE studenti (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(200) NOT NULL,
    corso_id INT NOT NULL
);

INSERT INTO corsi (nome_corso)
VALUES ('matematica');

INSERT INTO studenti (nome, corso_id)
VALUES ('luca', 3);

ALTER TABLE studenti
ADD COLUMN eta INT
AFTER nome;

UPDATE studenti
SET eta = 23
WHERE id = 1;

ALTER TABLE corsi
ADD COLUMN crediti INT;

UPDATE corsi
SET crediti = 10
WHERE id = 1;

SELECT MAX(eta) AS età_massima FROM studenti;

SELECT MIN(eta) AS età_minima FROM studenti;

SELECT SUM(eta) AS somma_età FROM studenti;

SELECT AVG(eta) AS media_età FROM studenti;

SELECT * FROM studenti WHERE nome IN ('valerio', 'mauro');

SELECT * FROM studenti WHERE eta BETWEEN 20 AND 26;

ALTER TABLE studenti
ADD COLUMN data_immatricolazione DATE;

SELECT * FROM studenti WHERE data_immatricolazione BETWEEN '2025-01-01' AND '2025-12-31';

ALTER TABLE studenti
ADD FOREIGN KEY (corso_id) REFERENCES corsi(id);

SELECT * FROM studenti
INNER JOIN corsi ON corso_id = corsi.id
WHERE corsi.nome_corso = 'fisica';



# esercizi

1. Seleziona tutti gli studenti dalla tabella STUDENTI

SELECT * FROM studenti;

2. Mostra solo il nome e l’età di tutti gli studenti.

SELECT nome, eta FROM studenti;

3. Visualizza tutti i corsi presenti nella tabella corsi.

SELECT * FROM corsi;

4. Conta quanti studenti sono presenti nella tabella.

SELECT COUNT(*) FROM studenti;

5. Elenca gli studenti ordinandoli per età dal più giovane al più anziano.

SELECT * FROM studenti ORDER BY eta ASC;

6. Trova tutti gli studenti con età superiore a 25 anni.

SELECT * FROM studenti WHERE eta > 25;

7. Mostra gli studenti immatricolati nell’anno 2023.

SELECT * 
FROM studenti 
WHERE YEAR(data_immatricolazione) = 2023;

8. Elenca gli studenti insieme al nome del loro corso (utilizzando una JOIN).

SELECT *
FROM studenti
JOIN corsi ON studenti.corso_id = corsi.id;

9. Conta quanti studenti sono iscritti a ciascun corso.

SELECT corsi.nome_corso, COUNT(*) AS numero_studenti
FROM studenti
JOIN corsi ON studenti.corso_id = corsi.id
GROUP BY corsi.nome_corso;

10. Trova gli studenti che hanno un’età inferiore all’età media generale.

SELECT corsi.nome_corso, AVG(studenti.eta) AS eta_media
FROM studenti
JOIN corsi ON studenti.corso_id = corsi.id
GROUP BY corsi.nome_corso;

11. Individua il corso con il numero maggiore di crediti.

SELECT *
FROM corsi
ORDER BY crediti DESC
LIMIT 1;

12. Mostra i corsi che non hanno nessuno studente iscritto.

SELECT *
FROM studenti
WHERE corso_id IS NULL;

13. Mostra gli studenti il cui nome inizia con la lettera A.

SELECT *
FROM studenti
WHERE nome LIKE 'A%';

14. Conta quanti studenti hanno la stessa età

SELECT 
eta,
COUNT(*) AS numero_studenti
FROM studenti
GROUP BY eta;

15. Mostra gli studenti che sono iscritti a corsi con più di 10 crediti

SELECT *
FROM studenti
JOIN corsi ON studenti.corso_id = corsi.id
WHERE corsi.crediti > 10;

16. Calcola la data di immatricolazione più recente e quella più vecchia

SELECT 
    MIN(data_immatricolazione) AS data_piu_vecchia,
    MAX(data_immatricolazione) AS data_piu_recente
FROM studenti;

17. Individua gli studenti che hanno un'età maggiore rispetto all'età media del loro corso

SELECT 
studenti.nome,
studenti.eta,
corsi.nome_corso
FROM studenti
JOIN corsi ON studenti.corso_id = corsi.id
WHERE studenti.eta > (
    SELECT AVG(s.eta)
    FROM studenti s
    WHERE s.corso_id = studenti.corso_id
);

18. Trova gli studenti con la data di immatricolazione più vicina alla data odierna

SELECT *
FROM studenti
WHERE data_immatricolazione = (
    SELECT MAX(data_immatricolazione)
    FROM studenti
);
