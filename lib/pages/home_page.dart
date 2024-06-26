import 'package:flutter/material.dart';
import '../widgets/shapes.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Geometric Shapes'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
              height: 200,
              child: DrawerHeader(
                child: Center(
                  child: Image.asset(
                    'assets/shapes_calculator_logo.png',
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
            ),
            const ListTile(
              title: Text(
                'IDENTITY',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
            ),
            const Divider(
              color: Colors.black,
              height: 1,
            ),
            const ListTile(
              leading: Icon(Icons.person),
              title: Text('Sahri Ramadan'),
              subtitle: Text('20210801460'),
            ),
            const ListTile(
              leading: Icon(Icons.person),
              title: Text('Andika Noor Ismawan'),
              subtitle: Text('20210801465'),
            ),
          ],
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          for (var shape in shapes)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => shape.page),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: Image.asset(
                            shape.imagePath,
                            width: 50,
                            height: 50,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          shape.name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}