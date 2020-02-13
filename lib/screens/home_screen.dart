import 'package:flutter/material.dart';
import 'package:flutter_travel_ui_starter/widgets/destination_carousel.dart';
import 'package:flutter_travel_ui_starter/widgets/hotel_carousel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selected_index = 0;
  int _currentTab = 0;
  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
        onTap: () {
          setState(() {
            _selected_index = index;
          });
          print(_selected_index);
        },
        child: Container(
          height: 60.0,
          width: 60.0,
          decoration: BoxDecoration(
              color: _selected_index == index
                  ? Theme.of(context).accentColor
                  : Color(0xFFE7EBEE),
              borderRadius: BorderRadius.circular(30.0)),
          child: Icon(
            _icons[index],
            size: 25.0,
            color: _selected_index == index
                ? Theme.of(context).primaryColor
                : Color(0xFFB4C1C4),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
            padding: EdgeInsets.symmetric(vertical: 30.0),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 20.0, right: 120.0),
                child: Text('What would you like to find?',
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: _icons
                    .asMap()
                    .entries
                    .map((MapEntry map) => _buildIcon(map.key))
                    .toList(),
              ),
              DestinationCarousel(),
              HotelCarousel(),
            ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentTab,
          onTap: (int value) {
            setState(() {
              _currentTab = value;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.search, size: 30), title: SizedBox.shrink()),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_pizza, size: 30),
                title: SizedBox.shrink()),
            BottomNavigationBarItem(
                icon: Icon(Icons.person, size: 30),
                // CircleAvatar(
                //   radius: 15.0,
                //   backgroundImage: NetworkImage(
                //       'https://image.flaticon.com/icons/png/512/21/21104.png'),
                // ),
                title: SizedBox.shrink())
          ]),
    );
  }
}