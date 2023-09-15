import 'package:flutter/material.dart';
import 'package:movie_demo/screen/dashboard/widget/home/widget/banner_widget.dart';
import 'package:provider/provider.dart';

import '../../../../core/constant/dimesions.dart';
import '../../../../core/provider/trending/trending_provider.dart';
import '../../../../core/repository/trending_repository.dart';
import '../../../movie/view/now_playing_tab.dart';
import '../../../movie/view/popular_movies_tab.dart';
import '../../../movie/view/search_movie_tab.dart';

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
    final TrendingRepository trendingRepository =
        Provider.of<TrendingRepository>(context);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TrendingProvider>(
            lazy: false,
            create: (BuildContext context) {
              TrendingProvider trendingProvider =
                  TrendingProvider(repository: trendingRepository);
              trendingProvider.loadDataList();
              return trendingProvider;
            }),
      ],
      child: NestedScrollView(
          floatHeaderSlivers: true,
          physics: const NeverScrollableScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverAppBar(
                  pinned: true,
                  backgroundColor: Colors.black,
                  expandedHeight: Dimesion.screeHigh * 0.34,
                  flexibleSpace:
                      const FlexibleSpaceBar(background: BannerImages()),
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
          body: TabBarView(controller: _tabController, children: const [
            NowPlayingMoviesTab(),
            PopularMoviesTab(),
            SearchMoviesTab(),
          ])),
    );
  }
}
