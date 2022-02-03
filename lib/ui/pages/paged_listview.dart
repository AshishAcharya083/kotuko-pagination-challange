import 'package:flutter/material.dart';
import 'package:kotuko_coding_challange/core/models/list_info_model.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:kotuko_coding_challange/core/service/airline_api.dart';
import 'package:kotuko_coding_challange/ui/components/List_item_tile.dart';
import 'package:kotuko_coding_challange/ui/pages/flight_detail_page.dart';

class PagedItemListView extends StatefulWidget {
  final AirlineApi? airlineApi;

  PagedItemListView({this.airlineApi});
  @override
  _PagedItemListViewState createState() => _PagedItemListViewState();
}

class _PagedItemListViewState extends State<PagedItemListView> {
  final _pagingController = PagingController<int, ListInfoModel>(
    // 2
    firstPageKey: 1,
  );

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    // try {
    final newPage = await widget.airlineApi!.getModelList(pageKey, 6);
    print('new page length is ${newPage.length}');
    final isLastPage = newPage.length < 6;

    final previouslyFetchedItemsCount = _pagingController.itemList?.length;

    if (isLastPage) {
      _pagingController.appendLastPage(newPage);
    } else {
      final nextPageKey = pageKey + newPage.length;
      _pagingController.appendPage(newPage, nextPageKey);
    }
    // }
    // catch (e) {
    //   print("The paging controller error is $e");
    //   _pagingController.error = e;
    // }
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PagedListView(
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<ListInfoModel>(
        itemBuilder: (context, item, index) {
          print("builder called");
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AirlineDetailPage(
                    airlineCountry: item.airlineCountry,
                    airlineLogo: item.airlineLogo,
                    airlineName: item.airlineName,
                    establishedDate: item.airlineEstablishedDate,
                    slogan: item.airlineSlogan,
                    website: item.airlineWebsite,
                  ),
                ),
              );
            },
            child: ListItemTile(
              listInfoModel: item,
            ),
          );
        },
      ),
    );
  }
}
