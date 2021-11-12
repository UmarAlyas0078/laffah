import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:laffah/constant/app_colors.dart';
import 'package:laffah/constant/fonts_family.dart';
import 'package:laffah/kf_drawer.dart';
import 'package:laffah/screens/main_page.dart';
import 'package:laffah/utils/class_builder.dart';
import 'package:sizer/sizer.dart';

void main() {
  ClassBuilder.registerClasses();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainWidget(),
      );
    });
  }
}

class MainWidget extends StatefulWidget {
  MainWidget({Key? key}) : super(key: key);

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> with TickerProviderStateMixin {
  late KFDrawerController _drawerController;

  @override
  void initState() {
    super.initState();
    _drawerController = KFDrawerController(
      initialPage: ClassBuilder.fromString('MainPage'),
      items: [
        KFDrawerItem(
          text: Text(
            'Payments',
            style: TextStyle(
                color: AppColors.menuItemColor,
                fontSize: 13.sp,
                fontFamily: FontConstant.OpenSansRegular),
          ),
          icon: Image.asset("assets/images/ic_payment.png",
              height: 16.0, width: 24.0),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'History',
            style: TextStyle(
                color: AppColors.menuItemColor,
                fontSize: 13.sp,
                fontFamily: FontConstant.OpenSansRegular),
          ),
          icon: Image.asset("assets/images/ic_history.png",
              height: 24.0, width: 24.0),
          page: MainPage(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Notifications',
            style: TextStyle(
                color: AppColors.menuItemColor,
                fontSize: 13.sp,
                fontFamily: FontConstant.OpenSansRegular),
          ),
          icon: Image.asset("assets/images/ic_notification.png",
              height: 24.0, width: 24.0),
          page: MainPage(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'How to Ride',
            style: TextStyle(
                color: AppColors.menuItemColor,
                fontSize: 13.sp,
                fontFamily: FontConstant.OpenSansRegular),
          ),
          icon: Image.asset("assets/images/ic_how_ride.png",
              height: 24.0, width: 24.0),
          page: MainPage(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Helpline',
            style: TextStyle(
                color: AppColors.menuItemColor,
                fontSize: 13.sp,
                fontFamily: FontConstant.OpenSansRegular),
          ),
          icon: Image.asset("assets/images/ic_help.png",
              height: 24.0, width: 24.0),
          page: MainPage(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'www.laffah.app',
            style: TextStyle(
                color: AppColors.menuItemColor,
                fontSize: 13.sp,
                fontFamily: FontConstant.OpenSansRegular),
          ),
          icon: Image.asset("assets/images/ic_website.png",
              height: 24.0, width: 24.0),
          page: MainPage(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Become a partner',
            style: TextStyle(
                color: AppColors.menuItemColor,
                fontSize: 13.sp,
                fontFamily: FontConstant.OpenSansRegular),
          ),
          icon: Image.asset("assets/images/ic_partner.png",
              height: 24.0, width: 24.0),
          page: MainPage(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Settings',
            style: TextStyle(
                color: AppColors.menuItemColor,
                fontSize: 13.sp,
                fontFamily: FontConstant.OpenSansRegular),
          ),
          icon: Image.asset("assets/images/ic_setting.png",
              height: 24.0, width: 24.0),
          page: MainPage(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KFDrawer(
//        borderRadius: 0.0,
//        shadowBorderRadius: 0.0,
//        menuPadding: EdgeInsets.all(0.0),
        scrollable: true,
        controller: _drawerController,
        header: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          width: MediaQuery.of(context).size.width * 0.6,
          child: Container(
            color: Colors.yellow,
            height: 20.0,
            width: 20.0,
          ),
        ),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(255, 255, 255, 1.0),
              Color.fromRGBO(255, 255, 255, 1.0)
            ],
            tileMode: TileMode.repeated,
          ),
        ),
      ),
    );
  }
}
