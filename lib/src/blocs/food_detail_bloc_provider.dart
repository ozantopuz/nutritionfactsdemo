import 'package:flutter/material.dart';

import 'food_detail_bloc.dart';

export 'food_detail_bloc.dart';

class FoodDetailBlocProvider extends InheritedWidget {
  final FoodDetailBloc bloc;

  FoodDetailBlocProvider({Key key, Widget child})
      : bloc = FoodDetailBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(_) {
    return true;
  }

  static FoodDetailBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(FoodDetailBlocProvider)
            as FoodDetailBlocProvider)
        .bloc;
  }
}
