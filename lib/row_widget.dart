import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  const RowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: <Widget>[
        _buildIcons(),
        const SizedBox(height: 24),
        _buildSubject(),
        const SizedBox(height: 24),
        _buildBurgers()
      ],
    );
  }

  Widget _buildIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        buildBox(
          const Icon(
            Icons.cake,
          ),
        ),
        buildBox(
          const Icon(
            Icons.local_drink,
          ),
        ),
        buildBox(
          const Icon(
            Icons.icecream,
          ),
        ),
        buildBox(
          const Icon(
            Icons.no_meals,
          ),
        ),
      ],
    );
  }

  Widget buildBox(Widget child) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blueGrey.shade200,
      ),
      padding: EdgeInsets.all(8),
      child: child,
    );
  }

  Widget _buildBurgers() {
    return Row(
      children: <Widget>[
        Expanded(child: _buildBurgerCard()),
        const SizedBox(width: 12),
        Expanded(child: _buildBurgerCard()),
      ],
    );
  }

  Widget _buildBurgerCard() {
    const urlBurger =
        'https://images.unsplash.com/photo-1586190848861-99aa4a171e90?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80';
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(12),
        color: const Color(0xFF010101),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(
              urlBurger,
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            const Text(
              'Beef Burger',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Onion with cheese',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '\$24.00',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubject() {
    const urlChemistry =
        'https://images.unsplash.com/photo-1532634993-15f421e42ec0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8N3xKVkl4cm5HZjBKTXx8ZW58MHx8fHw%3D&w=1000&q=80';

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: EdgeInsets.all(8),
        color: Colors.lightGreen,
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                urlChemistry,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 8),
            const Expanded(
              child: Text(
                'Chemistry',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                color: Colors.white30,
                width: 80,
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Text(
                      '2',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'quizzes',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
