import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  Menu({Key key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int index = 0;
  static const pages = [
    [AboutUs.pageTitle, AboutUs()],
    [Contact.pageTitle, Contact()],
    [DrinksList.pageTitle, DrinksList()],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[index][0]),
      ),
      body: pages[index][1],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (i) {
          setState(() {
            this.index = i;
          });
        },
        items: [
          BottomNavigationBarItem(
            title: Text("About us"),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text("Contact us"),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            title: Text("Drinks"),
            icon: Icon(Icons.home),
          ),
        ],
      ),
    );
  }
}

class AboutUs extends StatelessWidget {
  const AboutUs({Key key}) : super(key: key);

  static const pageTitle = "About us";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            "About us",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text(
            "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Facilis commodi repudiandae reprehenderit.",
          )
        ],
      ),
    );
  }
}

class Contact extends StatelessWidget {
  const Contact({Key key}) : super(key: key);

  static const pageTitle = "Contact us";

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text("Contact Us"),
            TextField(
              decoration: InputDecoration(
                labelText: "Name",
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Email",
              ),
            ),
            RaisedButton(
              color: Colors.red,
              child: Text(
                "Submit",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {},
            ),
          ],
        ));
  }
}

class DrinksList extends StatelessWidget {
  const DrinksList({Key key}) : super(key: key);

  static const pageTitle = "Drinks List";

  static const drinks = [
    "Coca Cola",
    "Sprite",
    "Chocolate Milk",
    "Nutella Hot Chocolate"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: GridView.builder(
        itemCount: drinks.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return Container(
            color: Colors.red,
            child: Card(
              color: Colors.red,
              child: Text(drinks[index], style: TextStyle(color: Colors.white)),
            ),
          );
        },
      ),
    );
  }
}

// GridView.builder(
//           itemCount: drinks.length,
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             mainAxisSpacing: 5,
//             crossAxisSpacing: 3,
//             crossAxisCount: 2,
//           ),
//           itemBuilder: (context, index) {
//             return Container(
//                 padding: EdgeInsets.all(10),
//                 color: Colors.red,
//                 child: FlatButton(
//                   onPressed: (){},
//                   child: Text(
//                     drinks[index],
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ));
//           }),
