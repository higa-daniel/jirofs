/// Category in the menu (e.g. Bebidas, Pratos).
class MenuCategory {
  const MenuCategory({
    required this.id,
    required this.name,
  });

  final String id;
  final String name;
}

/// A single menu item (dish/drink) with price and optional image.
class MenuItem {
  const MenuItem({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.categoryId,
    this.imageUrl,
  });

  final String id;
  final String name;
  final String description;
  final double price;
  final String categoryId;
  final String? imageUrl;
}
