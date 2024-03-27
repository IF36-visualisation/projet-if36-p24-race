| Title | Author | Date |
|-------|--------|------|
| 120 years of olympic history | Mohamed Amine Jabote, Thomas Francois, Freddy Durel Pouna Wantou | UTT - Semestre P24 |

</br>
<p align="center">
	<img src="https://st.depositphotos.com/2793427/4712/i/450/depositphotos_47122635-stock-photo-white-olympics-flag-against-the.jpg" width="80%" />	
</p>
</br>


# Introduction

Le jeu de données __"120 ans de l'histoire des Jeux Olympiques"__ contient les données de 28 éditions d'été et 22 d'hiver des Jeux Olympiques, ce qui équivaut à un peu moins de 136 000 individus, répartis sur 15 variables. Ces variables comprennent des informations telles que le nom de l'athlète, son âge, son poids, sa taille, son sexe, la saison des Jeux Olympiques, les médailles remportées, etc. Les données proviennent du site www.sports-reference.com et elles sont le résultat d'un travail de recherche réalisé par un groupe intéressé par l'histoire des jeux olympiques. Le site propose une base de données complète avec des informations diverses et variées sur les médailles gagnées par chaque pays, les résultats des compétitions, et bien plus encore.

Le jeu de données est disponible sur [Cette page Kaggle](https://www.kaggle.com/datasets/heesoo37/120-years-of-olympic-history-athletes-and-results?select=athlete_events.csv) et a été publié par [**Randi H Griffin**](https://www.linkedin.com/in/randigriffin/), une Lead Data Scientist chez __BCG__, dans le but de découvrir l'évolution des Jeux Olympiques ainsi que la participation et les performances des athlètes et des pays. Les données sont fournies au format __CSV__.

</br>

## Données

Le tableau ci-dessous présente les **15 attributs** du jeu de données sur lequel nous allons travailler. Ces données sont extraites d'un ensemble de données concernant les performances des athlètes aux Jeux olympiques.

Chaque attribut offre des informations précieuses sur les athlètes, les événements sportifs et les médailles remportées. Ces données sont pertinentes pour notre projet car elles nous permettront d'analyser les performances des athlètes dans différents sports et événements, d'étudier les tendances au fil des éditions des Jeux olympiques et d'identifier les caractéristiques des médaillés olympiques.

Certaines variables, telles que **le sexe de l'athlète**,**la saison des Jeux olympiques (été ou hiver)** et **la nationalité de l'équipe de l'athlète**, présentent des catégories ou des sous-groupes au sein des données, ce qui nous permettra d'effectuer des analyses plus détaillées en fonction de ces caractéristiques.

Le tableau ci-dessous offre une description détaillée de chaque attribut, y compris son nom, sa signification et son type de données. Ces informations serviront de référence tout au long de notre projet.

<br>
<div width="100%" align="center">

| Attribut   | Description                  | Type     |
|------------|------------------------------|----------|
| **ID**         | Identifiant unique de l'athlète        | Numérique|
| **Name**       | Nom de l'athlète                | Texte    |
| **Sexe**       | Sexe de l'athlète ***(homme ou femme)***            | Texte    |
| **Age**        | Âge de l'athlète lors des Jeux olympiques              | Numérique|
| **Height**     | Taille de l'athlète en centimètres          | Numérique|
| **Weight**     | Poids de l'athlète en kilogrammes           | Numérique|
| **Team**       | Nationalité de l'équipe de l'athlète           | Texte    |
| **NOC**        | Abréviation du Comité national olympique de l'équipe          | Texte    |
| **Games**      | Nom de l'édition des Jeux olympiques          | Texte    |
| **Year**       | Année de l'édition des Jeux olympiques        | Texte    |
| **Season**     | Saison des Jeux olympiques ***(été ou hiver)***     | Texte    |
| **City**       | Ville hôte des Jeux olympiques        | Texte    |
| **Sport**      | Sport pratiqué par l'athlète          | Texte    |
| **Event**      | Événement sportif dans lequel l'athlète a participé   | Texte    |
| **Medal**      | Type de médaille remportée par l'athlète ***(or, argent, bronze ou aucune)*** | Texte    |
</div>
</br>

## Plan d'analyse
Nous avons compilé une série de questions que nous tenterons de résoudre en utilisant le jeu de données. Ces questions sont divisées en deux catégories principales : l'évolution des Jeux Olympiques et les performances des athlètes.

#### L'évolution des Jeux Olympiques
1. Quels pays ont exercé une domination dans l'histoire des Jeux Olympiques ?  
   *Description*
3. Comment les Jeux Olympiques d'été se différencient-ils aux Jeux Olympiques d'hiver ?  
   *Description*
4. Comment varie le nombre d'épreuves sportives et le nombre d'athlètes participant aux Jeux Olympiques au fil du temps ?  
   *Description*
5. Est-ce que le pays hôte des Jeux Olympiques bénéficie d'un avantage par rapport aux autres nations participantes ?  
   *Description*
6. Existe-t-il une relation entre le niveau socio-économique d'un pays et ses performances aux Jeux Olympiques ? (Utiliser le PIB/h)  
   *Description*

#### Les athlètes
6. Quels sont les athlètes qui ont marqué les jeux olympiques ?  
   *Description*
7. Quels sont les impacts des caractéristiques physiques sur les résultats ?  
   *Description*
8. Est-ce que la répartition des médailles entre hommes et femmes varie selon les pays ?  
   *Description*
9. Comment la représentation des femmes aux Jeux Olympiques a-t-elle évolué au fil du temps ?  
   *Description*




