import 'package:flutter/material.dart';

import 'data/sample_menu.dart';
import 'models/menu_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2E7D32)),
        useMaterial3: true,
      ),
      home: const MenuScreen(),
    );
  }
}

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  String? _selectedCategoryId;
  final Map<String, int> _cart = {};

  List<MenuItem> get _filteredItems {
    if (_selectedCategoryId == null) return sampleMenuItems;
    return sampleMenuItems
        .where((item) => item.categoryId == _selectedCategoryId)
        .toList();
  }

  int get _cartCount =>
      _cart.values.fold(0, (sum, qty) => sum + qty);

  double get _cartTotal {
    double total = 0;
    for (final e in _cart.entries) {
      final item = sampleMenuItems.firstWhere((m) => m.id == e.key);
      total += item.price * e.value;
    }
    return total;
  }

  void _addToCart(MenuItem item) {
    setState(() {
      _cart[item.id] = (_cart[item.id] ?? 0) + 1;
    });
  }

  void _removeFromCart(String itemId) {
    setState(() {
      final qty = _cart[itemId] ?? 0;
      if (qty <= 1) {
        _cart.remove(itemId);
      } else {
        _cart[itemId] = qty - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 176,
        elevation: 0,
        scrolledUnderElevation: 2,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 112,
              child: Image.asset('assets/logo.png'),
            ),
            const SizedBox(height: 8),
            const Text(
              'Menu',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _CategoryChips(
            categories: sampleCategories,
            selectedId: _selectedCategoryId,
            onSelected: (id) => setState(() => _selectedCategoryId = id),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: _filteredItems.length,
              itemBuilder: (context, index) {
                final item = _filteredItems[index];
                final qty = _cart[item.id] ?? 0;
                return _MenuItemCard(
                  item: item,
                  quantity: qty,
                  onAdd: () => _addToCart(item),
                  onRemove: () => _removeFromCart(item.id),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: _cart.isEmpty
          ? null
          : _CartBar(
              itemCount: _cartCount,
              total: _cartTotal,
              onTap: () {
                // Could navigate to cart/checkout screen
                showModalBottomSheet<void>(
                  context: context,
                  builder: (context) => _CartSheet(
                    cart: _cart,
                    items: sampleMenuItems,
                    total: _cartTotal,
                    onRemove: _removeFromCart,
                    onAdd: (id) {
                      final item = sampleMenuItems.firstWhere((m) => m.id == id);
                      _addToCart(item);
                    },
                  ),
                );
              },
            ),
    );
  }
}

class _CategoryChips extends StatelessWidget {
  const _CategoryChips({
    required this.categories,
    required this.selectedId,
    required this.onSelected,
  });

  final List<MenuCategory> categories;
  final String? selectedId;
  final ValueChanged<String?> onSelected;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: FilterChip(
              label: const Text('Todos'),
              selected: selectedId == null,
              onSelected: (_) => onSelected(null),
            ),
          ),
          ...categories.map((c) => Padding(
                padding: const EdgeInsets.only(right: 8),
                child: FilterChip(
                  label: Text(c.name),
                  selected: selectedId == c.id,
                  onSelected: (_) => onSelected(c.id),
                ),
              )),
        ],
      ),
    );
  }
}

class _MenuItemCard extends StatelessWidget {
  const _MenuItemCard({
    required this.item,
    required this.quantity,
    required this.onAdd,
    required this.onRemove,
  });

  final MenuItem item;
  final int quantity;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 120x120 thumbnail image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                width: 120,
                height: 120,
                child: item.imageUrl != null
                    ? _buildItemImage(item.imageUrl!)
                    : _buildPlaceholderIcon(),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.description,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey.shade600,
                        ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'R\$ ${item.price.toStringAsFixed(2).replaceFirst('.', ',')}',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                      ),
                      if (quantity == 0)
                        FilledButton.tonalIcon(
                          onPressed: onAdd,
                          icon: const Icon(Icons.add, size: 20),
                          label: const Text('Adicionar'),
                        )
                      else
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton.filled(
                              style: IconButton.styleFrom(
                                padding: const EdgeInsets.all(4),
                                minimumSize: const Size(32, 32),
                              ),
                              onPressed: onRemove,
                              icon: const Icon(Icons.remove, size: 18),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                '$quantity',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                            IconButton.filled(
                              style: IconButton.styleFrom(
                                padding: const EdgeInsets.all(4),
                                minimumSize: const Size(32, 32),
                              ),
                              onPressed: onAdd,
                              icon: const Icon(Icons.add, size: 18),
                            ),
                          ],
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemImage(String imageUrl) {
    final isAsset = imageUrl.startsWith('asset:');
    final placeholder = _buildPlaceholderIcon();
    
    print('Attempting to load image: $imageUrl (isAsset: $isAsset)');
    
    if (isAsset) {
      final path = imageUrl.substring(6); // Remove 'asset:' prefix (6 characters)
      print('Loading asset image from path: $path');
      return Image.asset(
        path,
        fit: BoxFit.cover,
        width: 120,
        height: 120,
        errorBuilder: (context, error, stackTrace) {
          print('Image.asset error for path: $path, error: $error');
          print('Stack trace: $stackTrace');
          return placeholder;
        },
      );
    } else {
      print('Loading network image from URL: $imageUrl');
      return Image.network(
        imageUrl,
        fit: BoxFit.cover,
        width: 120,
        height: 120,
        errorBuilder: (context, error, stackTrace) {
          print('Image.network error for URL: $imageUrl, error: $error');
          print('Stack trace: $stackTrace');
          return placeholder;
        },
      );
    }
  }

  Widget _buildPlaceholderIcon() {
    return Container(
      width: 120,
      height: 120,
      color: Colors.grey.shade200,
      child: Icon(Icons.restaurant, color: Colors.grey.shade400, size: 48),
    );
  }
}

class _CartBar extends StatelessWidget {
  const _CartBar({
    required this.itemCount,
    required this.total,
    required this.onTap,
  });

  final int itemCount;
  final double total;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: SafeArea(
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Badge(
                  label: Text('$itemCount'),
                  child: const Icon(Icons.shopping_cart),
                ),
                Text(
                  'Ver carrinho',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                Text(
                  'R\$ ${total.toStringAsFixed(2).replaceFirst('.', ',')}',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CartSheet extends StatelessWidget {
  const _CartSheet({
    required this.cart,
    required this.items,
    required this.total,
    required this.onRemove,
    required this.onAdd,
  });

  final Map<String, int> cart;
  final List<MenuItem> items;
  final double total;
  final ValueChanged<String> onRemove;
  final ValueChanged<String> onAdd;

  @override
  Widget build(BuildContext context) {
    final entries = cart.entries.toList();
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      maxChildSize: 0.9,
      minChildSize: 0.3,
      expand: false,
      builder: (context, scrollController) {
        return Column(
          children: [
            const SizedBox(height: 8),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Carrinho',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: entries.length,
                itemBuilder: (context, index) {
                  final e = entries[index];
                  final item = items.firstWhere((m) => m.id == e.key);
                  return ListTile(
                    title: Text(item.name),
                    subtitle: Text('R\$ ${item.price.toStringAsFixed(2)} × ${e.value}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove_circle_outline),
                          onPressed: () => onRemove(item.id),
                        ),
                        Text('${e.value}'),
                        IconButton(
                          icon: const Icon(Icons.add_circle_outline),
                          onPressed: () => onAdd(item.id),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total', style: Theme.of(context).textTheme.titleLarge),
                  Text(
                    'R\$ ${total.toStringAsFixed(2).replaceFirst('.', ',')}',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
