import 'package:flutter/material.dart';

class GridViewWidget extends StatefulWidget {
  const GridViewWidget({Key? key}) : super(key: key);

  @override
  State<GridViewWidget> createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends State<GridViewWidget> {
  final List<String> _items = [
    'Wawan',
    'Windah',
    'Brando',
    'Bocil',
    'Basudara',
    'Tatang',
    'Mamang'
  ];

  bool _isAscending = true;

  List<String> getSortedItems() {
    if (_isAscending) {
      return _items..sort();
    } else {
      return _items.reversed.toList();
    }
  }

  String getSortText() => _isAscending ? 'Ascending' : 'Descending';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          color: Colors.white,
          child: TextButton.icon(
            icon: const RotatedBox(
              quarterTurns: 1,
              child: Icon(
                Icons.compare_arrows,
                size: 28,
              ),
            ),
            label: Text(
              getSortText(),
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            onPressed: () => _selectSort(),
          ),
        ),
        Expanded(child: buildList()),
      ],
    );
  }

  Widget buildList() {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
      ),
      itemCount: _items.length,
      itemBuilder: (context, index) {
        final sortedItems = getSortedItems();
        final item = sortedItems[index];

        return GridTile(
          child: InkWell(
            child: Ink.image(
              image: NetworkImage(
                'https://source.unsplash.com/random?sig=$index',
              ),
              fit: BoxFit.cover,
            ),
            onTap: () => _selectItem(index, item),
          ),
          footer: Container(
            padding: const EdgeInsets.all(12),
            alignment: Alignment.center,
            child: Text(
              item,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }

  void _selectSort() {
    setState(() {
      _isAscending = !_isAscending;
    });
  }

  void _selectItem(int index, String item) {
    final snackBar = SnackBar(
      content: Text(
        'Selected $item with index $index',
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
      backgroundColor: Colors.blue,
    );

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
