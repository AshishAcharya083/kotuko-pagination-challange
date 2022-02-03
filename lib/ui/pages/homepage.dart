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
  AirlineApi? airlineApi;
  @override
  void initState() {
    airlineApi = AirlineApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Passenger Details",
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
      ),
      body: PagedItemListView(
        airlineApi: airlineApi,
      ),
    );
  }
}
