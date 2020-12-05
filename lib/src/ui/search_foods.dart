import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nutritionfactsdemo/src/models/data_types.dart';
import 'package:nutritionfactsdemo/src/ui/widget/empty.dart';
import 'package:nutritionfactsdemo/src/ui/widget/loading.dart';

import '../blocs/food_detail_bloc_provider.dart';
import '../blocs/foods_bloc.dart';
import '../constants/constants.dart' as Constants;
import '../enum/sort_by_enum.dart';
import '../enum/sort_order_enum.dart';
import '../extension/extension.dart';
import '../models/search_item.dart';
import 'bottomsheet/filtering_modal_bottom_sheet.dart';
import 'bottomsheet/help_modal_bottom_sheet.dart';
import 'bottomsheet/sorting_modal_bottom_sheet.dart';
import 'food_detail.dart';
import 'widget/error.dart';

class SearchFoods extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SearchFoodsState();
  }
}

class SearchFoodsState extends State<SearchFoods> {
  final searchController = TextEditingController();
  bool hasSearchableQuery = false;
  String brandName = '';
  String sortBy = SortByEnum.score.name;
  String sortOrder = SortOrderEnum.asc.name;
  DataTypes dataTypes = DataTypes();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    foodsBloc.dispose();
    super.dispose();
  }

  void _searchFoods() {
    if (hasSearchableQuery) {
      var _dataTypes = new List();
      if (dataTypes.isBrandedSelected) _dataTypes.add('Branded');
      if (dataTypes.isFoundationSelected) _dataTypes.add('Foundation');
      if (dataTypes.isSRLegacySelected) _dataTypes.add('SR Legacy');
      if (dataTypes.isSurveySelected) _dataTypes.add('Survey');

      String body = jsonEncode({
        'query': searchController.text,
        'pageSize': Constants.PAGE_SIZE,
        'pageNumber': Constants.PAGE_NUMBER,
        'sortBy': sortBy,
        'sortOrder': sortOrder,
        'brandOwner': brandName,
        'dataType': _dataTypes,
      });

      foodsBloc.fetchSearchItem(body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          actions: <Widget>[
            if (hasSearchableQuery)
              IconButton(
                icon: Stack(children: <Widget>[
                  Icon(
                    Icons.sort,
                    color: Colors.white,
                  ),
                  if (sortBy != SortByEnum.score.name ||
                      sortOrder != SortOrderEnum.asc.name)
                    Positioned(
                      top: 0.0,
                      right: 0.0,
                      child: Icon(Icons.brightness_1,
                          size: 8.0, color: Colors.redAccent),
                    )
                ]),
                onPressed: () {
                  sortingModalBottomSheet(context, sortingCallback);
                },
              ),
            if (hasSearchableQuery)
              IconButton(
                icon: Stack(children: <Widget>[
                  Icon(
                    Icons.filter_list_alt,
                    color: Colors.white,
                  ),
                  if (dataTypes.isBrandedSelected ||
                      dataTypes.isFoundationSelected ||
                      dataTypes.isSRLegacySelected ||
                      dataTypes.isSurveySelected ||
                      brandName.isNotEmpty)
                    Positioned(
                      top: 0.0,
                      right: 0.0,
                      child: Icon(Icons.brightness_1,
                          size: 8.0, color: Colors.redAccent),
                    )
                ]),
                onPressed: () {
                  filteringModalBottomSheet(
                      context, dataTypes, brandName, filteringCallback);
                },
              ),
            IconButton(
              icon: Icon(
                Icons.help_center,
                color: Colors.white,
              ),
              onPressed: () {
                helpModalBottomSheet(context);
              },
            )
          ],
          title: Text('Nutrition Facts',
              style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.bold))),
      backgroundColor: Theme.of(context).accentColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              autofocus: true,
              onEditingComplete: () => {
                hasSearchableQuery = searchController.text.isNotEmpty &&
                    searchController.text.length > 3,
                _searchFoods(),
                FocusScope.of(context).unfocus()
              },
              style: TextStyle(color: Theme.of(context).primaryColor),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Theme.of(context).primaryColor),
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(4.0),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: Theme.of(context).primaryColor),
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(4.0),
                    ),
                  ),
                  filled: true,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Theme.of(context).primaryColor,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () =>
                    {hasSearchableQuery = false, searchController.clear()},
                    icon: Icon(Icons.clear,
                        color: Theme.of(context).primaryColor),
                  ),
                  hintStyle: TextStyle(color: Theme.of(context).primaryColor),
                  hintText: "Search a food",
                  fillColor: Theme.of(context).accentColor),
              controller: searchController,
            ),
            if (hasSearchableQuery)
              StreamBuilder(
                stream: foodsBloc.searchFoods,
                builder: (context, AsyncSnapshot<SearchItem> snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data.currentPage == 1 &&
                        snapshot.data.foods.isEmpty) {
                      return emptyWidget(context);
                    } else {
                      return buildList(snapshot);
                    }
                  } else if (snapshot.hasError) {
                    return errorWidget(snapshot.error);
                  }

                  // By default, show a loading spinner.
                  return Container(
                      margin: EdgeInsets.only(top: 150.0),
                      child: loadingWidget(context));
                },
              ),
          ],
        ),
      ),
    );
  }

  sortingCallback(String sortBy, String sortOrder) {
    setState(() {
      this.sortBy = sortBy;
      this.sortOrder = sortOrder;
      _searchFoods();
    });
  }

  filteringCallback(DataTypes dataTypes, String brandName) {
    setState(() {
      this.dataTypes = dataTypes;
      this.brandName = brandName;
      _searchFoods();
    });
  }

  Widget buildList(AsyncSnapshot<SearchItem> snapshot) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 16.0),
          child: SizedBox(
            child: ListView.builder(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: snapshot.data.foods.length,
              itemBuilder: (BuildContext context, int index) => GestureDetector(
                onTap: () => openDetailPage(snapshot.data, index),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).primaryColor),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(4.0),
                      )),
                  margin: EdgeInsets.only(bottom: 8.0),
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          snapshot.data.foods[index].lowercaseDescription
                              .ignoreNull,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w800,
                              fontSize: 16.0),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              snapshot.data.foods[index].brandOwner.ignoreNull,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12.0),
                            ),
                            Text(
                              'Score: ' +
                                  snapshot.data.foods[index].score.toString(),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12.0),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  openDetailPage(SearchItem data, int index) {
    final page = FoodDetailBlocProvider(
      child: FoodDetail(id: data.foods[index].fdcId),
    );
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return page;
      }),
    );
  }
}
