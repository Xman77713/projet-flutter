# flutter_projet_final

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

Pour ce projet, nous étions 4 au lancement, mais 2 de nos camarades (Pierre MANNIX et Romain MAURICE) ont dû quitter le
cursus à cause de leur alternance respective.

Finalement, voici la liste des personnes ayant participé au développement de cette application mobile en Flutter :

- Vincent LAGARDE
- Axel VERITE

Comme nous en avions convenu avec vous, nous devions réaliser les tâches suivantes :

- Écran d'accueil
- Toutes les listes (séries/comics/films)
- Au moins un écran de détail (peu importe lequel)

Nous avons finalement réalisé :

- L'écran d'accueil avec les différentes listes des 5 séries, comics et films les plus populaires
- Les Tabs de la page d'accueil qui redirigent vers des listes plus grandes
- Les listes plus détaillées accessibles en cliquant sur le bouton "Voir plus"
- Les listes complètes pour les séries/comics/films (100 éléments pour chaque liste)
- L'écran de détails d'un film, accessible en cliquant sur un film dans une liste ou depuis l'écran d'accueil
- Les Tabs de l'écran de détails d'un film, qui permettent de naviguer entre le synopsis, les personnages et les
  informations
- Pour l'API, presque toutes les requêtes ont été développées (certaines ne sont cependant pas utilisées, comme la
  récupération des détails d'une série ou d'un comics)

Ce que nous aurions voulu faire :

- Retrouver les mêmes icônes que sur la maquette dans Material
- Créer les pages de détails pour un comics et une série (actuellement, un clic sur une série ou un comics redirige bien
  grâce à une route, mais la page dédiée n’existe pas encore)
- Formater les chiffres et les dates selon la maquette
- Afficher des messages d'erreur compréhensible et permettre à l'utilisateur de relancer une requête
- Mettre en place l'appel API pour récupérer les épisodes d'une série
- Optimiser les appels API dans l'onglet "Personnages" (actuellement, chaque clic sur cet onglet relance un appel API,
  ce qui pourrait être optimisé)
- Améliorer certains détails d'affichage, comme l'alignement des informations d'un film
