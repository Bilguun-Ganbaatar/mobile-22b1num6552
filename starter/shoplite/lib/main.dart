import 'package:flutter/material.dart';

void main() {
  runApp(const ShopLiteApp());
}

class ShopLiteApp extends StatelessWidget {
  const ShopLiteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShopLite',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.teal, useMaterial3: true),
      home: const CartPage(),
    );
  }
}

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int _count = 0;

  void _increment() {
    if (_count < 10) {
      setState(() {
        _count++;
      });
    }
  }

  void _decrement() {
    if (_count > 0) {
      setState(() {
        _count--;
      });
    }
  }

  void _reset() {
    setState(() {
      _count = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('ShopLite — Миний сагс'),
        backgroundColor: colorScheme.primaryContainer,
        actions: [
          IconButton(onPressed: _reset, icon: const Icon(Icons.refresh)),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Сагсанд байгаа бараа:', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 12),
            Text('$_count', style: Theme.of(context).textTheme.headlineLarge),
            if (_count >= 10) ...[
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Нэг удаад 10-аас олон бараа захиалах боломжгүй',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: colorScheme.error, fontSize: 16),
                ),
              ),
            ],
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'add',
            onPressed: _count < 10 ? _increment : null,
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 12),
          FloatingActionButton(
            heroTag: 'remove',
            onPressed: _decrement,
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
