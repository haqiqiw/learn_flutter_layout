import 'package:flutter/material.dart';

class ListViewWidget extends StatefulWidget {
  const ListViewWidget({Key? key}) : super(key: key);

  @override
  State<ListViewWidget> createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
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
    return ListView.builder(
      itemCount: _items.length,
      itemBuilder: (context, index) {
        final sortedItems = getSortedItems();
        final item = sortedItems[index];

        return ListTile(
          leading: CircleAvatar(
            radius: 28,
            backgroundImage: NetworkImage(
              'https://source.unsplash.com/random?sig=$index',
            ),
          ),
          title: Text(item),
          subtitle: Text('Subtitle $index'),
          onTap: () => _selectItem(index, item),
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
