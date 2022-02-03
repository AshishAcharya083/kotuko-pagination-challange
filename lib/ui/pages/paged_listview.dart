import 'package:flutter/material.dart';
import 'package:kotuko_coding_challange/core/models/list_info_model.dart';
import 'package:kotuko_coding_challange/core/models/repository.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class PagedListView extends StatefulWidget {
  final Repository? repository;

  // PagedListView({this.repository}) : assert(repository != null);

  PagedListView({this.repository});
  @override
  _PagedListViewState createState() => _PagedListViewState();
}

class _PagedListViewState extends State<PagedListView> {
  final _pagingController = PagingController<int, ListInfoModel>(
    // 2
    firstPageKey: 0,
  );

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    // TODO: Implement the function's body.
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}
