/// Flutter code sample for BottomAppBar

// This example shows the [BottomAppBar], which can be configured to have a notch using the
// [BottomAppBar.shape] property. This also includes an optional [FloatingActionButton], which illustrates
// the [FloatingActionButtonLocation]s in relation to the [BottomAppBar].

import 'package:flutter/material.dart';

void main() {
  runApp(const HomeScreen());
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);
  @override
  State createState() => _BottomAppBarDemoState();
}

class _BottomAppBarDemoState extends State<HomeScreen> {
  bool _showFab = true;
  bool _showNotch = true;
  FloatingActionButtonLocation _fabLocation =
      FloatingActionButtonLocation.endDocked;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Invoice Generator PDF'),
        ),
        body: ListView(
          padding: const EdgeInsets.only(bottom: 88),
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text('Invoices List'),
            ),
          ],
        ),
        floatingActionButton: _showFab
            ? FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
          tooltip: 'Create',
        )
            : null,
        floatingActionButtonLocation: _fabLocation,
        bottomNavigationBar: _BottomFooterBar(
          fabLocation: _fabLocation,
          shape: _showNotch ? const CircularNotchedRectangle() : null,
        ),
      ),
    );
  }
}

class _BottomFooterBar extends StatelessWidget {
  const _BottomFooterBar({
    this.fabLocation = FloatingActionButtonLocation.endDocked,
    this.shape = const CircularNotchedRectangle(),
  });

  final FloatingActionButtonLocation fabLocation;
  final NotchedShape shape;



  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: shape,
      color: Colors.blue,
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          children: <Widget>[
            IconButton(
              tooltip: 'Open navigation menu',
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
            IconButton(
              tooltip: 'Search',
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
