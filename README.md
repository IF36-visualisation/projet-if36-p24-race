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

Nous avons sélectionné un ensemble de données sur les Jeux olympiques en raison de l'engouement actuel en France pour cet événement, en particulier avec les Jeux olympiques de **Paris 2024** à l'horizon. Les Jeux olympiques représentent une célébration mondiale de l'excellence sportive et de la diversité culturelle, et ils captivent l'attention de millions de personnes à travers le monde. Avec des membres de notre groupe ayant des niveaux de connaissances variés sur les Jeux olympiques, l'étude de ce dataset nous offre l'opportunité unique de plonger dans l'histoire et les tendances de cet événement emblématique, tout en élargissant notre compréhension de l'impact du sport sur la société à travers les âges.

Le jeu de données est disponible sur [Cette page Kaggle](https://www.kaggle.com/datasets/heesoo37/120-years-of-olympic-history-athletes-and-results?select=athlete_events.csv) et a été publié par [**Randi H Griffin**](https://www.linkedin.com/in/randigriffin/), une Lead Data Scientist chez __BCG__, dans le but de découvrir l'évolution des Jeux Olympiques ainsi que la participation et les performances des athlètes et des pays. Les données sont fournies au format __CSV__.

</br>

## Données

Le tableau ci-dessous présente les **15 attributs** du jeu de données sur lequel nous allons travailler. Ces données sont extraites d'un ensemble de données concernant les performances des athlètes aux Jeux olympiques.

Chaque attribut offre des informations précieuses sur les athlètes, les événements sportifs et les médailles remportées. Ces données sont pertinentes pour notre projet car elles nous permettront d'analyser les performances des athlètes dans différents sports et événements, d'étudier les tendances au fil des éditions des Jeux olympiques et d'identifier les caractéristiques des médaillés olympiques.

Certaines variables, telles que **le sexe de l'athlète**,**la saison des Jeux olympiques (été ou hiver)** et **la nationalité de l'équipe de l'athlète**, présentent des catégories ou des sous-groupes au sein des données, ce qui nous permettra d'effectuer des analyses plus détaillées en fonction de ces caractéristiques.

Le tableau ci-dessous offre une description détaillée de chaque attribut, y compris son nom, sa signification et son type de données. Ces informations serviront de référence tout au long de notre projet.

<br>
<div width="100%" align="center">

| Attribut   | Description                  | Type     | Format | Catégorie |
|------------|------------------------------|----------|-----------|-----------|
| **ID**         | Identifiant unique de l'athlète        | Texte | String | Nominal |
| **Name**       | Nom de l'athlète                | Texte    | String | Nominal |
| **Sexe**       | Sexe de l'athlète ***(homme ou femme)***            | Texte    | String | Nominal |
| **Age**        | Âge de l'athlète lors des Jeux olympiques              | Numérique| Integer | Continu|
| **Height**     | Taille de l'athlète en centimètres          | Numérique| Integer | Continu |
| **Weight**     | Poids de l'athlète en kilogrammes           | Numérique| Float | Continu |
| **Team**       | Nationalité de l'équipe de l'athlète           | Texte    | String | String | Nominal|
| **NOC**        | Abréviation du Comité national olympique de l'équipe          | Texte    | String | Nominal|
| **Games**      | Nom de l'édition des Jeux olympiques          | Texte    |  String | Nominal|
| **Year**       | Année de l'édition des Jeux olympiques        | Texte    | YYYY | Discret |
| **Season**     | Saison des Jeux olympiques ***(été ou hiver)***     | Texte    | String| Ordinal |
| **City**       | Ville hôte des Jeux olympiques        | Texte    | String | Nominal |
| **Sport**      | Sport pratiqué par l'athlète          | Texte    | String | Nominal |
| **Event**      | Événement sportif dans lequel l'athlète a participé   | Texte    | String | Nominal |
| **Medal**      | Type de médaille remportée par l'athlète ***(or, argent, bronze ou aucune)*** | Texte    | String | Ordinal|
</div>
</br>

## Plan d'analyse
Nous avons compilé une série de questions que nous tenterons de résoudre en utilisant le jeu de données. Ces questions sont divisées en deux catégories principales : l'évolution des Jeux Olympiques et les performances des athlètes.

#### L'évolution des Jeux Olympiques
1. Quels pays ont exercé une domination dans l'histoire des Jeux Olympiques ?  
   > *Description*
3. Comment les Jeux Olympiques d'été se différencient-ils aux Jeux Olympiques d'hiver ?  
   > Cette question examine comment les Jeux Olympiques d'été se différencient des Jeux Olympiques d'hiver en termes de sports pratiqués, de nombre d'épreuves , de participants, et d'autres aspects. Elle met en évidence les distinctions entre les deux versions du même évènement.
4. Comment varie le nombre d'épreuves sportives et le nombre d'athlètes participant aux Jeux Olympiques au fil du temps ?  
   > *Description*
5. Est-ce que le pays hôte des Jeux Olympiques bénéficie d'un avantage par rapport aux autres nations participantes ?  
   > *Description*
6. Existe-t-il une relation entre le niveau économique d'un pays et ses performances aux Jeux Olympiques ?
   > Il est intéressant d'explorer si le niveau économique d'un pays, mesuré par le PIB par habitant, influence ses performances aux Jeux Olympiques. Cette analyse nous aide à voir comment l'argent et les ressources affectent les succès sportifs à travers les nations.  
   > Nous utilisons une [basse de donnée](https://databank.worldbank.org/indicator/NY.GDP.PCAP.CD/1ff4a498/Popular-Indicators#) du PIB/habitant par pays depuis 1960 créée par [La Banque Mondiale](https://www.worldbank.org/en/home).

#### Les athlètes
6. Quels sont les athlètes qui ont marqué les jeux olympiques ?  
   > *Description*
7. Quels sont les impacts des caractéristiques physiques sur les résultats ?  
   > *Description*
8. Est-ce que la répartition des médailles entre hommes et femmes varie selon les pays ?  
   > *Description*
9. Comment la représentation des femmes aux Jeux Olympiques a-t-elle évolué au fil du temps ?  
   > *Description*




