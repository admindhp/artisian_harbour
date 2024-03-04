import 'package:artisian_harbour/Constants/Colours.dart';
import 'package:artisian_harbour/Presentation/Screens/Artisian.dart';
import 'package:artisian_harbour/Presentation/Screens/Productpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _selectedIndex = 0; // Index of the selected item in bottom navigation

  // List of pages corresponding to each item in bottom navigation
  final List<Widget> _pages = [
    HomePage(),
    Center(child: Text('Search Page')),
    Center(child: Text('Cart')),
    ChatPage(),
    Center(child: Text('Profile Page')),
  ];

  final List<String> _titles = [
    'Home',
    'Search',
    'Cart',
    'Chat With Artisian',
    'Profile'
  ];

  // Function to handle item selection in bottom navigation
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Make app bar transparent
        elevation: 0, // Remove app bar shadow
        centerTitle: true,
          title: Text(
            _titles[_selectedIndex], // Dynamic title based on the selected index
            style: TextStyle(color: Colours.black), // Title color
          ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: ImageIcon(
                AssetImage("assets/menu.jpg"),
                size: 40,
                color: Colors.black,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Open drawer on icon press
              },
            );
          },
        ),
        actions: [
          // Replace the profile button with the notification icon with badge
          Stack(
            children: [
              IconButton(
                icon: Icon(
                  Icons.notifications, // Notification icon
                  color: Colors.black, // Icon color
                ),
                onPressed: () {
                  // Handle notification icon press
                },
              ),
              Positioned(
                right: 10,
                top: 10,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red, // Badge background color
                    borderRadius: BorderRadius.circular(10),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: Text(
                    '2', // Notification count
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      drawer: Theme(
        data: ThemeData(splashColor: Colours.blue.withOpacity(0.15)), // Set splashColor to blue,
        child: Drawer(
          
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colours.blue,
                ),
                child: Text(
                  'Artisian Harbour',
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                title: Text('Settings'),
                onTap: () {
                  // Update UI based on item 1
                },
              ),
              ListTile(
                title: Text('About Us'),
                onTap: () {
                  // Update UI based on item 2
                },
              ),
              ListTile(
                title: Text('Log Out'),
                onTap: () {
                },
              ),
            ],
          ),
        ),
      ),
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 40, left: 20, right: 20), // Add margin to separate from bottom
        decoration: BoxDecoration(
          color: Colours.blue,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60),
            topRight: Radius.circular(60),
            bottomLeft: Radius.circular(60),
            bottomRight: Radius.circular(60),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(0.1),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: GNav(
            rippleColor: Colours.blue.withOpacity(0.6),
            hoverColor: Colors.grey,
            gap: 8,
            activeColor: Colors.white,
            iconSize: 24,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            duration: Duration(milliseconds: 400),
            tabBackgroundColor: Colours.black,
            color: Colours.black,
            tabs: [
              GButton(
                icon: Icons.home,
              ),
              GButton(
                icon: Icons.search,
              ),
              GButton(
                icon: Icons.shopping_cart,
              ),
              GButton(
                icon: Icons.chat,
              ),
              GButton(
                icon: Icons.person,
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              _onItemTapped(index);
            },
          ),
        ),
      ),
    );
  }
}
