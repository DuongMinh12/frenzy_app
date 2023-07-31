import 'package:flutter/material.dart';
import 'package:frenzy_app/constant/constants.dart';
import 'components/drawer_body.dart';


//Phần screen chính của UI thường được thu gọn chỉ còn mỗi cái khung sường để dễ nhìn hoặc dễ quản lý
// nhưng do code không dài nên phần nào quá dài tui mới rút gọn thành 1 widget riêng

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String routeName = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'F R E N Z Y',
            style: TextStyle(color: kMain, fontWeight: FontWeight.bold),
          ),
          iconTheme: IconThemeData(color: kMain),
          centerTitle: true,
          bottom: TabBar(
            unselectedLabelColor: kMain.withAlpha(200),
            labelColor: kMain,
            tabs: [
              Tab(
                icon: Icon(Icons.show_chart),
                text: "Trending",
              ),
              Tab(
                icon: Icon(Icons.local_fire_department),
                text: "Latest",
              )
            ],
          ),
          // leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu, color: kMain,),),
        ),

        //Drawer là menu
        drawer: Drawer(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              // mainAxisAlignment: MainAxisAlignment.start,
              //  crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildDrawerHeader(),
                buildListTile_drawer(context),
              ]),
        ),

        //TabBarView để chuyển trang qua lại giữa Trending và Latest
        body: TabBarView(
          children: [
            home_screen_1(),
            Container(
              child: Center(child: Text('Chức năng đang được phát triển', style: txt20!.copyWith(color: Colors.black),)),
            )
          ],
        ),
      ),
    );
  }
}
