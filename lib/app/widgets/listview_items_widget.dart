import 'package:flutter/material.dart';
import 'package:flutter_app_with_stackexchange/app/data/local/controller/localdb_controller.dart';
import 'package:flutter_app_with_stackexchange/app/internet_conroller.dart';
import 'package:flutter_app_with_stackexchange/app/widgets/loading_widget.dart';
import 'package:get/get.dart';

import 'package:flutter_app_with_stackexchange/app/data/remote/controller/api_controller.dart';
import 'package:flutter_app_with_stackexchange/app/routes/app_pages.dart';

class ListViewItems extends StatefulWidget {
  final ApiController ac;
  final NetController nc;
  const ListViewItems({Key? key, required this.ac, required this.nc})
      : super(key: key);

  @override
  State<ListViewItems> createState() => _ListViewItemsState();
}

class _ListViewItemsState extends State<ListViewItems> {
  LocalDBController localDBController = Get.put(LocalDBController());
// At the beginning, we fetch the first 30 posts
  int _page = 1;
  final int _limit = 30;

  // There is next page or not
  bool _hasNextPage = true;

  // Used to display loading indicators when _firstLoad function is running
  bool _isFirstLoadRunning = false;

  // Used to display loading indicators when _loadMore function is running
  bool _isLoadMoreRunning = false;

  // This holds the posts fetched from the server
  List _items = [];

  // This function will be called when the app launches (see the initState function)
  void _firstLoad() async {
    if (mounted) {
      setState(() {
        _isFirstLoadRunning = true;
      });
    }
    await widget.ac
        .getQuestions(_page, _limit)
        .whenComplete(() async => await localDBController.insertData());

    setState(() {
      _items = widget.ac.listQuestions.items!;
    });

    setState(() {
      _isFirstLoadRunning = false;
    });
  }

  // This function will be triggered whenver the user scroll
  // to near the bottom of the list view
  void _loadMore() async {
    if (_hasNextPage == true &&
        _isFirstLoadRunning == false &&
        _isLoadMoreRunning == false &&
        _controller.position.extentAfter < 300 &&
        (_limit % 100 == 0 || _limit == 30)) {
      setState(() {
        _isLoadMoreRunning = true; // Display a progress indicator at the bottom
      });
      _page += 1; // Increase _page by 1

      await widget.ac.getQuestions(_page, _limit);
      final List fetchedQuestions = widget.ac.listQuestions.items!;
      if (fetchedQuestions.isNotEmpty) {
        setState(() {
          _items.addAll(fetchedQuestions);
        });
      } else {
        // This means there is no more data
        // and therefore, we will not send another GET request
        setState(() {
          _hasNextPage = false;
        });
      }

      setState(() {
        _isLoadMoreRunning = false;
      });
    }
  }

  // The controller for the ListView
  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _firstLoad();
    _controller = ScrollController()..addListener(_loadMore);
  }

  @override
  void dispose() {
    _controller.removeListener(_loadMore);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isFirstLoadRunning
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                      shrinkWrap: true,
                      controller: _controller,
                      itemCount: _items.length,
                      itemBuilder: (context, index) {
                        if (_items.length == index) {
                          return LoadingWidget();
                        }
                        return Card(
                            child: ListTile(
                          isThreeLine: true,
                          onTap: () async => widget.nc.isOnline
                              ? await Get.toNamed(Routes.questionDetails,
                                  arguments: _items[index].questionId)
                              : null,
                          subtitle: Text(_items[index].title.toString(),
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ));
                      }),
                ),
              ),
              // when the _loadMore function is running
              if (_isLoadMoreRunning == true)
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 40),
                  child: Center(
                    child: LoadingWidget(),
                  ),
                ),

              // When nothing else to load
              if (_hasNextPage == false)
                Container(
                  padding: const EdgeInsets.only(top: 30, bottom: 40),
                  color: Colors.amber,
                  child: Center(
                    child: Text('You have fetched all of the content'),
                  ),
                ),
            ],
          );
  }
}
