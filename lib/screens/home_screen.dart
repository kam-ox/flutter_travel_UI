import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/destination_carousel.dart';
import '../widgets/hotel_carousel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
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
          _selectedIndex = index;
        });
        print(index);
      },
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ? Theme.of(context).accentColor
              : Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(60),
        ),
        child: Icon(
          _icons[index],
          size: 25,
          color: _selectedIndex == index
              ? Theme.of(context).primaryColor
              : Color(0xFFB4C1C4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30),
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 120,
              ),
              child: Text(
                'What would you like to find?',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ..._icons //! Никогда не хардкодь
                    .asMap()
                    .entries
                    .map(
                      (e) => _buildIcon(e.key),
                    )
                    .toList(),
              ],
            ),
            SizedBox(height: 20),
            DestinationCarousel(),
            SizedBox(height: 20),
            HotelCarousel(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        //** Making bottom navigation Bar
        onTap: (int value) {
          setState(() {
            _currentTab = value;
          });
        },
        currentIndex: _currentTab,
        items: [
          BottomNavigationBarItem(
            title: SizedBox.shrink(), // ? how works?
            icon: Icon(
              Icons.search,
              size: 30,
            ),
          ),
          BottomNavigationBarItem(
            title: SizedBox.shrink(),
            icon: Icon(
              FontAwesomeIcons.burn,
              size: 25,
            ),
          ),
          BottomNavigationBarItem(
              title: SizedBox.shrink(),
              icon: CircleAvatar(
                //! we can use Circle avatar as icon
                radius: 15,
                backgroundImage: NetworkImage(
                    'https://cdn.pixabay.com/photo/2017/11/19/07/30/girl-2961959_960_720.jpg'),
              )),
        ],
      ),
    );
  }
}
