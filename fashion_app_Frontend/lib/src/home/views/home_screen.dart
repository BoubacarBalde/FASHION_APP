import 'package:fashion_app/common/utils/packages_exports.dart';
import 'package:fashion_app/src/home/controllers/home_tab_notifier.dart';
import 'package:fashion_app/src/home/widgets/custom_app_bar.dart';
import 'package:fashion_app/src/home/widgets/home_slider.dart';
import 'package:fashion_app/src/home/widgets/home_tab.dart';
import 'package:fashion_app/src/products/widgets/explore_products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/categories_list.dart';
import '../widgets/home_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  late final TabController _tabController;
  int _currentTabIndex = 0;

  @override
  void initState() {
    _tabController = TabController(length: homeTabs.length, vsync: this);

    _tabController.addListener((_handlerSelection));
    super.initState();
  }

  void _handlerSelection(){
    final controllers = Provider.of<HomTabNotifier>(context, listen: false);

    if(_tabController.indexIsChanging){
      setState(() {
        _currentTabIndex = _tabController.index;
      });
      controllers.setIndex(homeTabs[_currentTabIndex]);
    }
  }

  @override
  void dispose() {
    _tabController.removeListener(_handlerSelection);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(110),
        child: CustomAppBar(),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 12.h),
          children: [
            SizedBox(
              height: 20.h,
            ),
            HomeSlider(),
            SizedBox(height: 16.h,),
            HomeHeader(),
            SizedBox(height: 10.h,),
            HomeCategoriesList(),
            SizedBox(height: 10.h),
            HomeTabs(tabController: _tabController),
            SizedBox(height: 15.h),
            ExploreProducts()
          ],
        ),
      ),
    );
  }
}

List <String> homeTabs = ['All','Popular','Unisex','Men','Women','Kids'];
