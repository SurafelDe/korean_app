import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';

class HomeTabbedPage extends StatefulWidget {
  const HomeTabbedPage({super.key});

  @override
  State<HomeTabbedPage> createState() => _HomeTabbedPageState();
}

class _HomeTabbedPageState extends State<HomeTabbedPage> {
  int pageIndex = 0;

  void changePageIndex(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Home(),
      floatingActionButton: Container(
        margin: EdgeInsets.only(top: 20),
        height: 60,
        width: 60,
        child: Material(
          type: MaterialType.transparency,
          child: Ink(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white12, width: 3.0),
              gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black, Color(0xff2F2F2F)]),
              shape: BoxShape.circle,
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(500.0),
              onTap: () {},
              child: const ImageIcon(AssetImage('assets/icons/star.png')),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 5,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Material(
            elevation: 0.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            child: BottomNavigationBar(
              elevation: 0,
              backgroundColor: Colors.black,
              currentIndex: pageIndex,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.redAccent,
              unselectedItemColor: Colors.grey[700],
              // backgroundColor: Colors.black,
              items: const [
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/icons/home.png')),
                    label: '홈'),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/icons/location.png')),
                    label: '스팟'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.import_contacts_sharp,
                      size: 0,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/icons/message.png')),
                    label: '채팅'),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage('assets/icons/person.png')),
                    label: '마이')
              ],
              onTap: (index) {
                changePageIndex(index);
              },
            ),
          )),
    );
  }
}
