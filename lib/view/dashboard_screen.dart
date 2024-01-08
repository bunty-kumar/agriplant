import 'package:agriplant/view/cart/cart_page.dart';
import 'package:agriplant/view/home/home_page.dart';
import 'package:agriplant/view/profile/profile_page.dart';
import 'package:agriplant/view/services/services_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DashboardScreen extends StatefulWidget {
  final int currentPage;

  const DashboardScreen({Key? key, this.currentPage = 0}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final pages = [
    const HomePage(),
    const ServicesPage(),
    const CartPage(),
    const ProfilePage()
  ];
  int _backButtonCount = 0;
  var _selectedIndex = 0;

  @override
  void initState() {
    _selectedIndex = widget.currentPage;
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  bool onBackPressed() {
    if (_selectedIndex != 0) {
      _backButtonCount = 0;
      _onItemTapped(0);
      return false;
    } else {
      if (_backButtonCount == 1) {
        return true;
      } else {
        Fluttertoast.showToast(
            msg: "Press back again to exit", toastLength: Toast.LENGTH_SHORT);
        _backButtonCount += 1;
        return false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Hello Jhon 🙋‍",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              "Enjoy our services",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton.filledTonal(
                onPressed: () {},
                icon: const Badge(
                    label: Text(
                      "3",
                      style: TextStyle(fontSize: 12),
                    ),
                    child: Icon(
                      Icons.notifications,
                      color: Colors.green,
                    ))),
          )
        ],
      ),
      body: WillPopScope(
          onWillPop: () async {
            return onBackPressed();
          },
          child: pages[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: "Services"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.profile_circled), label: "Profile")
        ],
      ),
    );
  }
}
