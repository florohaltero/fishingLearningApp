class CategoryModel {
  const CategoryModel(this.id, this.title, this.description);

  final int id;
  final String title;
  final String description;
}

const List<CategoryModel> categories = [
  CategoryModel(
    0,
    'Allgemeine Fischkunde',
    'Fragen über allgemeine Fischkunde: '
        'Fischarten, Fischanatomie, Fortpflanzung',
  ),
  CategoryModel(1, 'Spezielle Fischkunde', 'Spezielle Fischkunde'),
  CategoryModel(2, 'Gewässerökologie und Fischhege', 'description'),
  CategoryModel(3, 'Gerätekunde, Fangtechnik', 'description'),
  CategoryModel(4, 'Rechtskunde', 'Rechtskunde'),
];
