import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth_service.dart';
import 'package:flutter_application_1/login_page.dart';

import 'crud_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CrudService service = CrudService();
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController qtyCtrl = TextEditingController();
  bool showFavoritesOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Firebase | Parondo'), // <- change to YOUR lastname
        centerTitle: true,
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: Icon(
              showFavoritesOnly ? Icons.favorite : Icons.favorite_border,
              color: Colors.white,
            ),
            onPressed: () =>
                setState(() => showFavoritesOnly = !showFavoritesOnly),
          ),
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () async {
              await AuthService().signOut();
              if (!context.mounted) return;
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const LoginPage()),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () => openAddDialog(context),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: service.getItems(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          var docs = snapshot.data!.docs;
          if (showFavoritesOnly) {
            docs = docs.where((d) {
              final data = d.data() as Map<String, dynamic>;
              return (data['isFavorite'] ?? false) == true;
            }).toList();
          }
          if (docs.isEmpty) {
            return const Center(
              child: Text('No items found', style: TextStyle(fontSize: 18)),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: docs.length,
            itemBuilder: (context, index) {
              var item = docs[index];
              final data = item.data() as Map<String, dynamic>;
              final bool isFav = data['isFavorite'] ?? false;
              return Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  title: Text(
                    data['name'],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Quantity ${data['quantity']}',
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(
                          isFav ? Icons.favorite : Icons.favorite_border,
                          color: isFav ? Colors.red : Colors.grey,
                        ),
                        onPressed: () =>
                            service.toggleFavorite(item.id, !isFav),
                      ),
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.orange),
                        onPressed: () => openEditDialog(context, item),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _confirmDelete(context, item.id),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  // DELETE UI
  void _confirmDelete(BuildContext context, String id) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Delete item'),
        content: const Text('Are you sure you want to delete this item?'),
        actions: [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(dialogContext),
          ),
          TextButton(
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
            onPressed: () {
              service.deleteItem(id);
              Navigator.pop(dialogContext);
            },
          ),
        ],
      ),
    );
  }

  // ADD UI
  void openAddDialog(BuildContext context) {
    nameCtrl.clear();
    qtyCtrl.clear();

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Add Item'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameCtrl,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: qtyCtrl,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Quantity',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(dialogContext),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('Save'),
            onPressed: () {
              final qty = int.tryParse(qtyCtrl.text);
              if (nameCtrl.text.isNotEmpty && qty != null) {
                service.addItem(nameCtrl.text, qty);
                Navigator.pop(dialogContext);
              }
            },
          ),
        ],
      ),
    );
  }

  // EDIT UI
  void openEditDialog(BuildContext context, DocumentSnapshot item) {
    final data = item.data() as Map<String, dynamic>;
    nameCtrl.text = data['name'];
    qtyCtrl.text = data['quantity'].toString();

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Edit Item'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameCtrl,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: qtyCtrl,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Quantity',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(dialogContext),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('Edit'),
            onPressed: () {
              final qty = int.tryParse(qtyCtrl.text);
              if (nameCtrl.text.isNotEmpty && qty != null) {
                service.updateItem(item.id, nameCtrl.text, qty);
                Navigator.pop(dialogContext);
              }
            },
          ),
        ],
      ),
    );
  }
}
