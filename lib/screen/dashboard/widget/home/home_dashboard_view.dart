import 'package:flutter/material.dart';

import '../../../../core/constant/dimesions.dart';
import '../../../movie/view/now_playing_tab.dart';

class HomeDashboardViewWidget extends StatefulWidget {
  const HomeDashboardViewWidget({super.key});

  @override
  State<HomeDashboardViewWidget> createState() =>
      _HomeDashboardViewWidgetState();
}

class _HomeDashboardViewWidgetState extends State<HomeDashboardViewWidget>
    with TickerProviderStateMixin {
  TextEditingController searchController = TextEditingController();
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        floatHeaderSlivers: true,
        physics: const NeverScrollableScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverAppBar(
                pinned: true,
                backgroundColor: Colors.black,
                expandedHeight: Dimesion.screeHigh * 0.34,
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(Dimesion.screeHigh * 0.03),
                  child: TabBar(
                      indicatorColor: Colors.white,
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.grey[400],
                      controller: _tabController,
                      isScrollable: true,
                      labelStyle: Theme.of(context).textTheme.titleSmall,
                      tabs: const [
                        Tab(
                          text: "Now Playing",
                        ),
                        Tab(
                          text: "Popular Movies",
                        ),
                        Tab(
                          text: "Search",
                        )
                      ]),
                ),
              ),
            ],
        body: TabBarView(controller: _tabController, children: [
          const NowPlayingMoviesTab(),
          Container(),
          Container(),
        ]));
  }
}
