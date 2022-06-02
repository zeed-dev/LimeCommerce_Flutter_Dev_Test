class Category {
  final int id;
  final String title;

  Category({
    required this.id,
    required this.title,
  });
}

List<Category> mockData = [
  Category(id: 1, title: "All Products"),
  Category(id: 2, title: "Skin Care"),
  Category(id: 3, title: "Hair Care"),
  Category(id: 4, title: "Makeup"),
  Category(id: 4, title: "Nail"),
];
