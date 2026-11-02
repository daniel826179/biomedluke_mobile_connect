import 'package:flutter/material.dart';

// Modelo de datos limpio para evitar problemas con mapas genéricos
class ItemModel {
  final String code;
  final String name;
  final String stock;

  ItemModel({required this.code, required this.name, required this.stock});
}

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  // Lista tipada con la nueva estructura de objetos
  final List<ItemModel> _inventoryItems = [
    ItemModel(code: "REF-001", name: "Sensor SpO2", stock: "12"),
    ItemModel(code: "REF-002", name: "Batería Desfibrilador", stock: "5"),
  ];

  void _addItem() {
    setState(() {
      _inventoryItems.add(
        ItemModel(code: "REF-003", name: "Cable ECG 5 derivaciones", stock: "8"),
      );
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Nuevo elemento agregado exitosamente (Create)')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Consulta de Inventario (CRUD)')),
      body: ListView.builder(
        itemCount: _inventoryItems.length,
        itemBuilder: (context, index) {
          final item = _inventoryItems[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: const Icon(Icons.medical_services, color: Colors.blue),
              title: Text(item.name),
              subtitle: Text('Código: ${item.code} | Stock: ${item.stock} unidades'),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  setState(() {
                    _inventoryItems.removeAt(index);
                  });
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        tooltip: 'Agregar Elemento',
        child: const Icon(Icons.add),
      ),
    );
  }
}