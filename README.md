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
   > Dans cette analyse, nous chercherons à identifier les pays qui ont accumulé le plus grand nombre de médailles dans l'histoire des Jeux Olympiques, qu'elles soient en or, argent ou bronze, ainsi que le total de ces médailles. De plus, nous déterminerons pour chaque discipline quel pays a remporté le plus de médailles.<br>
    __Visualisation possibles :__
    ***Graphique à barres des meilleurs pays par médailles :*** pour comparer directement les performances des pays les plus réussis. Il permet une comparaison claire et rapide des totaux de médailles entre les principaux pays, ce qui est utile pour identifier les leaders incontestés et les écarts significatifs entre eux.
    ***Diagramme circulaire ou camembert des médailles par type :*** pour illustrer la répartition des médailles par type pour chaque pays. Il offre une vue d'ensemble instantanée des performances relatives en or, argent et bronze, permettant de déterminer si un pays a une domination particulière dans une catégorie de médailles.
    ***courbe présentant l'évolution du nombre total de médailles sur les 150 dernières années pour les pays dominants:*** permet d'identifier les périodes de domination ou de déclin, ainsi que les évolutions à long terme des performances olympiques des pays.
2. Comment les Jeux Olympiques d'été se différencient-ils aux Jeux Olympiques d'hiver ?  
   > Cette question examine comment les Jeux Olympiques d'été se différencient des Jeux Olympiques d'hiver en termes de sports pratiqués, de nombre d'épreuves , de participants, et d'autres aspects. Elle met en évidence les distinctions entre les deux versions du même évènement.<br>
    __Visualisation possibles :__
    ***Graphique en barres du nombre d'épreuves :*** graphique en barres comparant le nombre total d'épreuves aux Jeux Olympiques d'été et d'hiver au fil du temps. Cela permet de visualiser les variations dans la taille et la complexité des deux événements au fil des ans.
    ***Diagramme circulaire des participants :*** Un diagramme circulaire montrant la répartition des participants par région ou pays aux Jeux Olympiques d'été et d'hiver. Cela permet de comparer la diversité géographique des participants entre les deux événements.
    ***Graphique en barres empilées des médailles par pays :*** Un graphique en barres empilées comparant les médailles remportées par chaque pays aux Jeux Olympiques d'été et d'hiver. Cette visualisation met en évidence les performances des pays dans les deux types de jeux et permet de déterminer s'il existe des différences significatives dans les pays dominant chaque événement.
3. Comment varie le nombre d'épreuves sportives et le nombre d'athlètes participant aux Jeux Olympiques au fil du temps ?  
   > L'objectif ici est de déterminer quels sont les sports qui ont été intégrés au cours des années et à quel moment ceux ci se sont intégrés. Ceci aussi a pour visée de déterminer la raison de l'ajout de ces disciplines(popularité grandissante ou juste nouveau sport). Dans un second temps il s'agira d'identifier ou non l'entrée en liste de nouveaux pays participants dans les jeux. D'en déterminer les origines(première qualification ou alors accueil de nouveaux pays admissibles). Enfin il s'agit de déterminer comment évolue le nombre d'athlètes participant aux jeux au fil des années.<br>
    __Visualisation possibles :__
    ***Graphique en ligne du nombre d'athlètes par année :*** Un graphique en ligne représentant l'évolution du nombre total d'athlètes participant aux Jeux Olympiques au fil des ans. Cette visualisation mettrait en évidence les variations dans la taille de la délégation olympique mondiale au fil du temps.
    ***Graphique en barres du nombre d'épreuves par discipline sportive :*** Un graphique en barres montrant le nombre d'épreuves par discipline sportive (par exemple, course, lancer, saut pour l'athlétisme) aux Jeux Olympiques au fil du temps. Cela offre une vue détaillée des changements dans la composition et la diversité des épreuves sportives au fil des ans.
4. Est-ce que le pays hôte des Jeux Olympiques bénéficie d'un avantage par rapport aux autres nations participantes ?  
   > Cette question vise à déterminer si le pays hôte des Jeux Olympiques bénéficie d'un avantage en termes de participation et de performances sportives, telles que le nombre de médailles accumulées, par rapport aux autres nations participantes. L'objectif est d'analyser si le fait d'accueillir les Jeux Olympiques donne un élan supplémentaire aux athlètes du pays hôte, leur permettant de performer au-dessus de la moyenne par rapport à leurs performances habituelles.<br>
    __Visualisation possibles :__
    ***Graphique en barres du nombre de médailles par pays :*** Un graphique en barres comparant le nombre total de médailles remportées par le pays hôte par rapport aux autres nations participantes. Cela permettrait de voir visuellement si le pays hôte obtient plus de médailles que la moyenne des autres pays.
    ***Graphique en barres empilées des médailles par type pour le pays hôte et les autres nations :*** Un graphique en barres empilées montrant la répartition des médailles d'or, d'argent et de bronze remportées par le pays hôte et les autres nations participantes. Cette visualisation permettrait de comparer les performances dans chaque catégorie de médailles.
    ***Nuage de points des performances par rapport à la moyenne :*** Un nuage de points avec le pays hôte et les autres nations sur l'axe des x et le nombre total de médailles sur l'axe des y. Chaque point représenterait une édition des Jeux Olympiques, et sa position par rapport à une ligne moyenne permettrait de visualiser si le pays hôte surperforme ou sous-performe par rapport à la moyenne des autres nations.
5. Existe-t-il une relation entre le niveau économique d'un pays et ses performances aux Jeux Olympiques ?
   > Il est intéressant d'explorer si le niveau économique d'un pays, mesuré par le PIB par habitant, influence ses performances aux Jeux Olympiques. Cette analyse nous aide à voir comment l'argent et les ressources affectent les succès sportifs à travers les nations.  
   > Nous utilisons une [base de donnée](https://databank.worldbank.org/indicator/NY.GDP.PCAP.CD/1ff4a498/Popular-Indicators#) du PIB/habitant par pays depuis 1960 créée par [La Banque Mondiale](https://www.worldbank.org/en/home).<br>
     __Visualisation possibles :__
    ***Nuage de points du PIB par habitant par rapport au nombre de médailles :*** Un nuage de points avec le PIB par habitant sur l'axe des x et le nombre total de médailles remportées sur l'axe des y pour chaque pays participant aux Jeux Olympiques. Chaque point représente un pays pour une année donnée, permettant de visualiser s'il existe une corrélation entre la richesse économique d'un pays et son succès aux Jeux Olympiques.
    ***Graphique en ligne de l'évolution du PIB par habitant et du nombre de médailles :*** Un graphique en ligne avec le PIB par habitant et le nombre total de médailles remportées pour chaque année olympique. Cette visualisation permettrait d'observer comment l'évolution du niveau économique d'un pays au fil du temps est liée à ses performances aux Jeux Olympiques.

#### Les athlètes
6. Quels sont les athlètes qui ont marqué les jeux olympiques ?  
   > *Description*
   > Cette question cherche à identifier les athlètes qui ont marqué les Jeux Olympiques par leurs performances exceptionnelles. L'objectif est d'analyser les données historiques des Jeux Olympiques pour identifier les athlètes les plus médaillés, les records établis et les moments marquants de l'histoire des Jeux.<br>
    __Visualisation possibles :__
    ***Graphique en barres des athlètes les plus médaillés :*** n graphique en barres montrant les athlètes ayant remporté le plus grand nombre de médailles olympiques, classés par discipline sportive ou nombre total de médailles. Cette visualisation permettrait d'identifier les athlètes les plus titrés de l'histoire des Jeux Olympiques.
    ***Graphique en nuage de points des records battus au fil du temps :*** Un graphique en nuage de points représentant les records olympiques battus au fil des éditions des Jeux Olympiques. Chaque point représenterait un record battu dans une discipline sportive spécifique, avec l'année sur l'axe des x et la performance réalisée sur l'axe des y. Cette visualisation permettrait de visualiser les tendances et les progrès réalisés dans différentes disciplines au fil du temps. 
7. Quels sont les impacts des caractéristiques physiques sur les résultats ?  
   > *Description*
   > Cette question vise à explorer les impacts des caractéristiques physiques des athlètes sur leurs performances aux Jeux Olympiques. L'objectif est d'analyser comment des facteurs tels que la taille, le poids, l'âge et d'autres caractéristiques physiques peuvent influencer les résultats sportifs.<br>
    __Visualisation possibles :__
    ***Graphique en nuage de points de la taille et du poids des médaillés :*** Un graphique en nuage de points représentant la relation entre la taille et le poids des athlètes médaillés dans différentes disciplines sportives. Cela permettrait d'identifier s'il existe des tendances générales entre les caractéristiques physiques des athlètes et leurs performances.
    ***Graphique en barres des médailles par tranche d'âge :*** Un graphique en barres montrant la répartition des médailles par tranche d'âge des athlètes. Cela permettrait d'analyser si les performances sportives varient en fonction de l'âge des athlètes et s'il existe des différences significatives entre les groupes d'âge.
    ***Analyse de corrélation entre les caractéristiques physiques et les performances (Nuage) :*** Une analyse statistique explorant les corrélations entre les caractéristiques physiques telles que la taille, le poids, l'âge, etc., et les performances sportives des athlètes. Cette analyse pourrait mettre en évidence les facteurs physiques qui ont le plus d'impact sur les résultats sportifs aux Jeux Olympiques.
8. Est-ce que la répartition des médailles entre hommes et femmes varie selon les pays ?  
   > *Description*
   > Cette question vise à examiner si la répartition des médailles entre hommes et femmes varie d'un pays à l'autre aux Jeux Olympiques. L'objectif est d'analyser les différences de performances entre les athlètes masculins et féminins dans différentes nations participantes.<br>
    __Visualisation possibles :__
    ***Graphique en barres de la répartition des médailles par genre pour chaque pays :*** Un graphique en barres comparant le nombre total de médailles remportées par les athlètes masculins et féminins pour chaque pays participant. Cela permettrait de visualiser visuellement les différences de performances entre hommes et femmes dans différents pays.
    ***Graphique en secteurs ou camembert de la répartition des médailles par genre :*** Un graphique en secteurs montrant la répartition des médailles entre hommes et femmes pour l'ensemble des Jeux Olympiques. Cela pourrait révéler la proportion relative de médailles remportées par chaque genre et mettre en évidence les pays où les performances des femmes sont les plus ou les moins représentées.
9. Comment la représentation des femmes aux Jeux Olympiques a-t-elle évolué au fil du temps ?  
   > *Description*
   > Cette question vise à analyser l'évolution de la représentation des femmes aux Jeux Olympiques au fil du temps. L'objectif est d'identifier les tendances et les changements dans la participation et les performances des athlètes féminines dans différents sports et pays au fil des éditions des Jeux Olympiques.<br>
    __Visualisation possibles :__
    ***Graphique en ligne de la participation des femmes au fil du temps :*** Un graphique en ligne montrant la proportion de femmes parmi tous les athlètes participants aux Jeux Olympiques au fil des éditions. Cela permettrait de visualiser la tendance à l'augmentation de la participation des femmes dans le sport olympique.
    ***Graphique en barres de la répartition des médailles par genre au fil du temps :*** Un graphique en barres comparant le nombre total de médailles remportées par les athlètes masculins et féminins pour chaque édition des Jeux Olympiques. Cela permettrait de visualiser visuellement les changements dans les performances des femmes par rapport aux hommes au fil du temps.
    ***Carte géographique de la participation féminine par pays :*** Une carte géographique montrant la participation des athlètes féminines dans différents sports et pays au fil des éditions des Jeux Olympiques. Cela permettrait de visualiser les variations régionales dans la représentation des femmes dans le sport olympique et d'identifier les pays où des progrès significatifs ont été réalisés en matière d'inclusion des femmes dans le sport.




