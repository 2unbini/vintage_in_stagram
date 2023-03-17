import 'package:flutter/material.dart';
import 'package:vintage_in_stagram/tabs/tab_home.dart';
import 'package:vintage_in_stagram/tabs/tab_mypage.dart';
import 'package:vintage_in_stagram/widgets/widget_search_bar.dart';

class IndexScreen extends StatefulWidget {
  @override
  _IndexScreenState createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  int _index = 0;

  final List<Widget> _tabs = [HomeTab(), MypageTab()];
  final List<String> _tabTitles = ['Home', 'My Page'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: _index,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: _tabTitles[0]),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: _tabTitles[1])
        ],
      ),
      appBar: _index != 0
          ? AppBar(
        toolbarHeight: 120,
        flexibleSpace: Container(
          color: Colors.grey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                _tabTitles[_index],
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20))
            ],
          )
        ),
      )
          : null,
      body: _index == 0
          ? NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    expandedHeight: 120.0,
                    floating: false,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                        centerTitle: true,
                        title: Text("Vintage INstagram",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            )),
                        background: Image.network(
                          "https://p4.wallpaperbetter.com/wallpaper/583/790/442/vintage-cityscape-city-monochrome-wallpaper-preview.jpg",
                          fit: BoxFit.cover,
                        )),
                  ),
                  SliverPersistentHeader(
                    delegate: _SliverAppBarDelegate(SearchBar(
                      height: MediaQuery.of(context).size.height * 0.1,
                    )),
                    pinned: true,
                  ),
                ];
              },
              body: Center(
                child: _tabs[_index],
              ),
            )
          : _tabs[_index],
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._searchBar);

  final SearchBar _searchBar;

  @override
  double get minExtent => _searchBar.preferredSize.height;

  @override
  double get maxExtent => _searchBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _searchBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
