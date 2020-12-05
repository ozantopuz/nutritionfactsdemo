import 'package:flutter/material.dart';
import '../blocs/food_detail_bloc_provider.dart';
import '../models/food.dart';
import '../ui/widget/error.dart';
import '../ui/widget/loading.dart';

import '../blocs/food_detail_bloc.dart';
import '../constants/constants.dart' as Constants;
import '../extension/extension.dart';

class FoodDetail extends StatefulWidget {
  final int id;

  FoodDetail({this.id});

  @override
  State<StatefulWidget> createState() {
    return FoodDetailState(id: id);
  }
}

class FoodDetailState extends State<FoodDetail> {
  final int id;

  FoodDetailBloc bloc;

  FoodDetailState({this.id});

  @override
  void didChangeDependencies() {
    bloc = FoodDetailBlocProvider.of(context);
    bloc.fetchFoodDetail(id);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  String findPercentage(double x, double y) {
    String percentage = ((y / x) * 100).toStringAsFixed(0);
    if (percentage == "0")
      return '';
    else
      return ((y / x) * 100).toStringAsFixed(0) + '%';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          iconTheme: IconThemeData(color: Theme.of(context).accentColor),
          centerTitle: true,
          title: Text('Nutrition Facts',
              style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.bold))),
      backgroundColor: Colors.white,
      body: StreamBuilder(
        stream: bloc.foodDetail,
        builder: (context, AsyncSnapshot<Food> snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Theme.of(context).primaryColor),
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(4.0),
                          )),
                      child: Column(
                        children: [
                          Text('Nutrition Facts ',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 40.0,
                              )),
                          Divider(
                              thickness: 10.0,
                              color: Theme.of(context).primaryColor),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                                snapshot.data.description.ignoreNull
                                    .toString()
                                    .toLowerCase(),
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 32.0,
                                )),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(top: 4.0, bottom: 4.0),
                            child: Text(snapshot.data.brandOwner.ignoreNull,
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 18.0,
                                )),
                          ),
                          Divider(
                              thickness: 0.5,
                              color: Theme.of(context).primaryColor),
                          Container(
                            margin: EdgeInsets.only(bottom: 4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Serving size',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 14.0,
                                    )),
                                Text(
                                    snapshot.data.servingSize
                                            .toString()
                                            .ignoreNull +
                                        " " +
                                        snapshot
                                            .data.servingSizeUnit.ignoreNull,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 18.0,
                                    ))
                              ],
                            ),
                          ),
                          Divider(
                              thickness: 4.0,
                              color: Theme.of(context).primaryColor),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Amount per serving ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 16.0,
                                      )),
                                  Text('Calories',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 37.0,
                                      )),
                                ],
                              ),
                              if (snapshot.data.labelNutrients != null)
                                Text(
                                    snapshot.data.labelNutrients.calories
                                        .getDoubleValue()
                                        .toInt()
                                        .toString()
                                        .ignoreNull,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 60.0,
                                    )),
                            ],
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            child: Text('% Daily Value*',
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 10.0,
                                )),
                          ),
                          Divider(
                              thickness: 0.5,
                              color: Theme.of(context).primaryColor),
                          Container(
                            margin: EdgeInsets.only(top: 4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (snapshot.data.labelNutrients != null)
                                  Text(
                                      'Total Fat ' +
                                          snapshot.data.labelNutrients.fat
                                              .getValue("g"),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900)),
                                if (snapshot.data.labelNutrients != null)
                                  Text(
                                      findPercentage(
                                          Constants.DAILY_TOTAL_FAT_VALUE,
                                          snapshot.data.labelNutrients.fat
                                              .getDoubleValue()),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900))
                              ],
                            ),
                          ),
                          Divider(
                              thickness: 0.5,
                              color: Theme.of(context).primaryColor),
                          Container(
                            margin: EdgeInsets.only(left: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (snapshot.data.labelNutrients != null)
                                  Text(
                                      'Saturated Fat ' +
                                          snapshot
                                              .data.labelNutrients.saturatedFat
                                              .getValue("g"),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300)),
                                if (snapshot.data.labelNutrients != null)
                                  Text(
                                      findPercentage(
                                          Constants.DAILY_SAT_FAT_VALUE,
                                          snapshot
                                              .data.labelNutrients.saturatedFat
                                              .getDoubleValue()),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900))
                              ],
                            ),
                          ),
                          Divider(
                              thickness: 0.5,
                              color: Theme.of(context).primaryColor),
                          Container(
                            margin: EdgeInsets.only(left: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (snapshot.data.labelNutrients != null)
                                  Text(
                                      'Trans Fat ' +
                                          snapshot.data.labelNutrients.transFat
                                              .getValue("g"),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300)),
                              ],
                            ),
                          ),
                          Divider(
                              thickness: 0.5,
                              color: Theme.of(context).primaryColor),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (snapshot.data.labelNutrients != null)
                                  Text(
                                      'Cholesterol ' +
                                          snapshot
                                              .data.labelNutrients.cholesterol
                                              .getValue("mg"),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900)),
                                if (snapshot.data.labelNutrients != null)
                                  Text(
                                      findPercentage(
                                          Constants.DAILY_CHOLESTEROL_VALUE,
                                          snapshot
                                              .data.labelNutrients.cholesterol
                                              .getDoubleValue()),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900))
                              ],
                            ),
                          ),
                          Divider(
                              thickness: 0.5,
                              color: Theme.of(context).primaryColor),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (snapshot.data.labelNutrients != null)
                                  Text(
                                      'Sodium ' +
                                          snapshot.data.labelNutrients.sodium
                                              .getValue("mg"),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900)),
                                if (snapshot.data.labelNutrients != null)
                                  Text(
                                      findPercentage(
                                          Constants.DAILY_SODIUM_VALUE,
                                          snapshot.data.labelNutrients.sodium
                                              .getDoubleValue()),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900))
                              ],
                            ),
                          ),
                          Divider(
                              thickness: 0.5,
                              color: Theme.of(context).primaryColor),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (snapshot.data.labelNutrients != null)
                                  Text(
                                      'Total Carbonhydrate ' +
                                          snapshot
                                              .data.labelNutrients.carbohydrates
                                              .getValue("g"),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900)),
                                if (snapshot.data.labelNutrients != null)
                                  Text(
                                      findPercentage(
                                          Constants.DAILY_TOTAL_CARBOHYDRATE_VALUE,
                                          snapshot
                                              .data.labelNutrients.carbohydrates
                                              .getDoubleValue()),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900))
                              ],
                            ),
                          ),
                          Divider(
                              thickness: 0.5,
                              color: Theme.of(context).primaryColor),
                          Container(
                            margin: EdgeInsets.only(left: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (snapshot.data.labelNutrients != null)
                                  Text(
                                      'Dietary Fiber ' +
                                          snapshot.data.labelNutrients.fiber
                                              .getValue("g"),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300)),
                                if (snapshot.data.labelNutrients != null)
                                  Text(
                                      findPercentage(
                                          Constants.DAILY_DIETARY_FIBER_VALUE,
                                          snapshot.data.labelNutrients.fiber
                                              .getDoubleValue()),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900))
                              ],
                            ),
                          ),
                          Divider(
                              thickness: 0.5,
                              color: Theme.of(context).primaryColor),
                          Container(
                            margin: EdgeInsets.only(left: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (snapshot.data.labelNutrients != null)
                                  Text(
                                      'Total Sugar ' +
                                          snapshot.data.labelNutrients.sugars
                                              .getValue("g"),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300))
                              ],
                            ),
                          ),
                          Divider(
                              thickness: 0.5,
                              color: Theme.of(context).primaryColor),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (snapshot.data.labelNutrients != null)
                                  Text(
                                      'Protein ' +
                                          snapshot.data.labelNutrients.protein
                                              .getValue("g"),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900)),
                                Text('',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w900))
                              ],
                            ),
                          ),
                          Divider(
                              thickness: 0.5,
                              color: Theme.of(context).primaryColor),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (snapshot.data.labelNutrients != null)
                                  Text(
                                      'Calcium ' +
                                          snapshot.data.labelNutrients.calcium
                                              .getValue("mg"),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300)),
                                if (snapshot.data.labelNutrients != null)
                                  Text(
                                      findPercentage(
                                          Constants.DAILY_CALCIUM_VALUE,
                                          snapshot.data.labelNutrients.calcium
                                              .getDoubleValue()),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900))
                              ],
                            ),
                          ),
                          Divider(
                              thickness: 0.5,
                              color: Theme.of(context).primaryColor),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (snapshot.data.labelNutrients != null)
                                  Text(
                                      'Iron ' +
                                          snapshot.data.labelNutrients.iron
                                              .getValue("mg"),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300)),
                                if (snapshot.data.labelNutrients != null)
                                  Text(
                                      findPercentage(
                                          Constants.DAILY_IRON_VALUE,
                                          snapshot.data.labelNutrients.iron
                                              .getDoubleValue()),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900))
                              ],
                            ),
                          ),
                          Divider(
                              thickness: 0.5,
                              color: Theme.of(context).primaryColor),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (snapshot.data.labelNutrients != null)
                                  Text(
                                      'Potassium ' +
                                          snapshot.data.labelNutrients.potassium
                                              .getValue("mg"),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300)),
                                if (snapshot.data.labelNutrients != null)
                                  Text(
                                      findPercentage(
                                          Constants.DAILY_POTASSIUM_VALUE,
                                          snapshot.data.labelNutrients.potassium
                                              .getDoubleValue()),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w900))
                              ],
                            ),
                          ),
                          Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(top: 16.0),
                              child: Text(
                                  '*Percent Daily Values are based on a 2000 calorie diet',
                                  style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 10.0))),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 64.0),
                    )
                  ],
                ));
          } else if (snapshot.hasError) {
            return errorWidget(snapshot.error);
          }

          // By default, show a loading spinner.
          return loadingWidget(context);
        },
      ),
    );
  }
}
