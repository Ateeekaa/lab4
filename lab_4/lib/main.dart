import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Flutter Lab 4'),
            bottom: TabBar(
              tabs: [
                Tab(text: "ListView"),
                Tab(text: "GridView"),
              ],
            ),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(color: Colors.blue),
                  child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
                ),
                ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Home'),
                    onTap: () {}),
                ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Profile'),
                    onTap: () {}),
                ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Settings'),
                    onTap: () {}),
                ListTile(
                    leading: Icon(Icons.logout),
                    title: Text('Logout'),
                    onTap: () {}),
                ListTile(
                    leading: Icon(Icons.card_membership),
                    title: Text('Cards'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CardScreen()),
                      );
                    }),
                ListTile(
                    leading: Icon(Icons.notifications),
                    title: Text('Show Toast'),
                    onTap: () {
                      Fluttertoast.showToast(
                        msg: "Hello, Flutter!",
                        gravity: ToastGravity.BOTTOM,
                      );
                    }),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Item ${index + 1}'),
                    subtitle: Text('Subtitle ${index + 1}'),
                    leading: Icon(Icons.list),
                  );
                },
              ),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(8),
                    color: Colors.primaries[index % Colors.primaries.length],
                    child: Center(
                      child: Text('${index + 1}', style: TextStyle(fontSize: 24, color: Colors.white)),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ✅ Card экраны
class CardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cards')),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: List.generate(5, (index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                Image.network('https://via.placeholder.com/150'),
                ListTile(
                  title: Text('Title ${index + 1}'),
                  subtitle: Text('Description ${index + 1}'),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}