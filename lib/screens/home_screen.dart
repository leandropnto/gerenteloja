import 'package:flutter/material.dart';
import 'package:gerenteloja/configs/styles.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  PageController _pageController;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            canvasColor: primaryColor,
            primaryColor: Colors.white,
            textTheme: Theme.of(context)
                .textTheme
                .copyWith(caption: TextStyle(color: Colors.white54))),
        child: BottomNavigationBar(
          currentIndex: _page,
          onTap: (page){
            _pageController.animateToPage(page, duration: Duration(microseconds: 500), curve: Curves.easeIn);
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.person), title: Text('Clientes')),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), title: Text('Pedidos')),
            BottomNavigationBarItem(
                icon: Icon(Icons.list), title: Text('Produtos')),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (page){
          setState(() {
            _page = page;
          });
        },
        children: <Widget>[
          Container(color: Colors.red,),
          Container(color: Colors.yellow,),
          Container(color: Colors.green,),
        ],
      ),
    );
  }
}
