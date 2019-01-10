import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _customScrollViewBuild(),
      bottomNavigationBar: _bottomNavigatorBuild(),
    );
  }

  @override
  void dispose() {}

  Widget _appBarNiduuBuilder() {
    return SliverAppBar(
      backgroundColor: Colors.green,
      expandedHeight: 90.0,
      floating: false,
      pinned: true,
      elevation: 0.0,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          color: Colors.white,
          child: ClipPath(
            clipBehavior: Clip.antiAlias,
            child: Container(color: Colors.green),
            clipper: BottomCurveClipper(),
          ),
        ),
      ),
    );
  }

  Widget _customScrollViewBuild() {
    return CustomScrollView(
      slivers: <Widget>[
        _appBarNiduuBuilder(),
        _sectionCampaign(),
        _sectionCourse(),
      ],
    );
  }

  Widget _sectionCampaign() {
    return SliverFixedExtentList(
      itemExtent: 130.0,
      delegate: SliverChildBuilderDelegate((BuildContext _, int __) {
        return ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            _cardCampaignBuild(),
            _cardCampaignBuild(),
            _cardCampaignBuild(),
          ],
        );
      }, childCount: 1),
    );
  }

  Widget _sectionCourse() {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 250.0,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: 2.0,
      ),
      delegate: SliverChildBuilderDelegate((BuildContext _, int index) {
        return _cardCourseBuild(index);
      }, childCount: 20),
    );
  }

  Widget _cardCampaignBuild() {
    return Container(
      width: 250.0,
      color: Colors.teal,
      margin: EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
    );
  }

  Widget _cardCourseBuild(int index) {
    return Container(
      color: Colors.amber,
      margin: _edgeInsetsForIndex(index),
    );
  }

  Widget _bottomNavigatorBuild() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: 0,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.mail),
          title: Text('Email'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text('Person'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_call),
          title: Text('Box'),
        ),
      ],
    );
  }

  EdgeInsets _edgeInsetsForIndex(int index) {
    if (index % 2 == 0) {
      return EdgeInsets.only(left: 8.0);
    } else {
      return EdgeInsets.only(right: 8.0);
    }
  }
}

class BottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final heightOffset = 18.0;
    final path = new Path();
    final controlPoint = Offset(
      size.width / 2,
      size.height + heightOffset,
    );
    final endPoint = Offset(
      size.width,
      size.height - heightOffset,
    );

    path.lineTo(0.0, size.height - heightOffset);
    path.quadraticBezierTo(
      controlPoint.dx,
      controlPoint.dy,
      endPoint.dx,
      endPoint.dy,
    );
    path.lineTo(size.width, size.height - heightOffset);
    path.lineTo(size.width, 0.0);
    path.close();

    // Borber
    path.lineTo(0.0, size.height - heightOffset * 2);
    path.quadraticBezierTo(
      controlPoint.dx,
      controlPoint.dy,
      endPoint.dx,
      endPoint.dy,
    );
    path.lineTo(size.width, size.height - heightOffset * 2);
    path.lineTo(size.width, 0.0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
