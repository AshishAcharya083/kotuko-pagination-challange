import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:kotuko_coding_challange/core/service/airline_api.dart';
import 'package:kotuko_coding_challange/ui/components/List_item_tile.dart';
import 'package:kotuko_coding_challange/ui/pages/paged_listview.dart';
import 'package:kotuko_coding_challange/utils/screen_size.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    AirlineApi airlineApi = AirlineApi();
    airlineApi.getPassengerWithSize(page: 0, size: 3);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PagedListView(),
    );
  }
}
