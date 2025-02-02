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

Pour ce projet nous étions 4 au lancement mais deux de nos camarades (Pierre MANNIX et Romain MAURICE) ont du quitter le
cursus à cause de leur alternance respective.
Finalement, voici la liste des personnes ayant participé au développement de cette application mobile en flutter :

- Vincent LAGARDE
- Axel VERITE

Comme nous avions convenus avec vous. Nous devions réaliser les tâches suivantes :

- Écran d'accueil
- Toutes les listes (séries/comics/films)
- Au moins un écran de détail (peu importe lequel)

Nous avons finalement réalisé :

- L'écran d'accueil avec les différentes listes des 5 séries, comics et films les plus populaires
- Les Tabs de la page d'accueil qui nous redirige vers les listes plus grandes
- Les listes plus détaillées sont aussi disponibles au clique sur le bouton "Voir plus"
- Les listes de chaque séries, comics et films (100 éléments pour chaque liste)
- L'écran de détails d'un film, au clique sur un film dans la liste ou dans l'écran d'accueil
- Les Tabs de l'écran de détails d'un film qui nous redirige vers le synopsis, les personnages et les infos
- Pour l'API, quasiement toutes les requêtes ont été développées (cependant certaines ne sont pas utilisée comme par
  exemple la récupération des détails d'une série et d'un comics)

Ce qu'on aurait voulu faire :

- Retrouver les mêmes icônes que sur la maquette dans Material
- Les pages détails pour un comics et une série (étant donné qu'au clique sur une série et un comics, nous sommes
  rédirigé grâce à une route)
- Formatter les chiffres et les dates selon la maquette
- Message d'erreur compréhensible ainsi que la possibilité de relancer une requête
- L'appel API pour récupérer les épisodes d'une série
