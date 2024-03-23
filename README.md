---
title: "Proposition - 120 years of olympic history"
author: "IF36 - Race (Mohamed Amine Jabote, Thomas Francois, Freddy durel Pouna Wantou)"
date: "UTT - Semestre P24"

output:
  rmdformats::material:
    thumbnails: false
    gallery: true
---

# Introduction

Le jeu de données __"120 ans de l'histoire des Jeux Olympiques"__ contient les données de 28 éditions d'été et 22 d'hiver des Jeux Olympiques, ce qui équivaut à un peu moins de 136 000 individus, répartis sur 15 variables. Ces variables comprennent des informations telles que le nom de l'athlète, son âge, son poids, sa taille, son sexe, la saison des Jeux Olympiques, les médailles remportées, etc. Les données proviennent du site www.sports-reference.com et elles sont le résultat d'un travail de recherche réalisé par un groupe intéressé par l'histoire des jeux olympiques. Le site propose une base de données complète avec des informations diverses et variées sur les médailles gagnées par chaque pays, les résultats des compétitions, et bien plus encore.

Le jeu de données est disponible sur [Cette page Kaggle](https://www.kaggle.com/datasets/heesoo37/120-years-of-olympic-history-athletes-and-results?select=athlete_events.csv) et a été publié par [**Randi H Griffin**](https://www.linkedin.com/in/randigriffin/), une Lead Data Scientist chez __BCG__, dans le but de découvrir l'évolution des Jeux Olympiques ainsi que la participation et les performances des femmes et des pays. Les données sont fournies au format __CSV__.


## Données


Le tableau ci-dessous présente les **15 attributs** du jeu de données sur lequel nous allons travailler. Ces données sont extraites d'un ensemble de données concernant les performances des athlètes aux Jeux olympiques.

Chaque attribut offre des informations précieuses sur les athlètes, les événements sportifs et les médailles remportées. Ces données sont pertinentes pour notre projet car elles nous permettront d'analyser les performances des athlètes dans différents sports et événements, d'étudier les tendances au fil des éditions des Jeux olympiques et d'identifier les caractéristiques des médaillés olympiques.

Certaines variables, telles que **le sexe de l'athlète**,**la saison des Jeux olympiques (été ou hiver)** et **la nationalité de l'équipe de l'athlète**, présentent des catégories ou des sous-groupes au sein des données, ce qui nous permettra d'effectuer des analyses plus détaillées en fonction de ces caractéristiques.

Le tableau ci-dessous offre une description détaillée de chaque attribut, y compris son nom, sa signification et son type de données. Ces informations serviront de référence tout au long de notre projet.

__Tableau :__


| Attribut   | description                  | Type     |
|------------|------------------------------|----------|
| **ID**         | identifiant unique de l'athlète        | Numérique|
| **Name**       | nom de l'athlète                | Texte    |
| **Sexe**       | sexe de l'athlète ***(homme ou femme)***            | Texte    |
| **Age**        | âge de l'athlète lors des Jeux olympiques              | Numérique|
| **Height**     | taille de l'athlète en centimètres          | Numérique|
| **Weight**     | poids de l'athlète en kilogrammes           | Numérique|
| **Team**       | nationalité de l'équipe de l'athlète           | Texte    |
| **NOC**        | abréviation du Comité national olympique de l'équipe          | Texte    |
| **Games**      | nom de l'édition des Jeux olympiques          | Texte    |
| **Year**       | année de l'édition des Jeux olympiques        | Texte    |
| **Season**     | saison des Jeux olympiques ***(été ou hiver)***     | Texte    |
| **City**       | ville hôte des Jeux olympiques        | Texte    |
| **Sport**      | sport pratiqué par l'athlète          | Texte    |
| **Event**      | événement sportif dans lequel l'athlète a participé   | Texte    |
| **Medal**      | type de médaille remportée par l'athlète ***(or, argent, bronze ou aucune)*** | Texte    |

## Plan d'analyse

élaborez sur les questions que vous souhaitez vous poser sur les données. Quelles sont vos interrogations ? Quelles informations pensez-vous obtenir ? Quelles variables souhaitez-vous comparer ? Qu’est-ce qui pourrait poser problème ? Autrement dit : comment comptez-vous analyser ces données ?
