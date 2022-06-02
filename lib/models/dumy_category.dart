class Category {
  final int id;
  final String title;

  Category({
    required this.id,
    required this.title,
  });
}

List<Category> mockData = [
  Category(id: 1, title: "All Dishes"),
  Category(id: 2, title: "Drink"),
  Category(id: 3, title: "Dessert"),
  Category(id: 4, title: "Beverage"),
  Category(id: 4, title: "Hot Dishes"),
];
