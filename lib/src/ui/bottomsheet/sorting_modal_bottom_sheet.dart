import 'package:flutter/material.dart';
import 'package:nutritionfactsdemo/src/enum/sort_by_enum.dart';
import 'package:nutritionfactsdemo/src/enum/sort_order_enum.dart';

void sortingModalBottomSheet(context, callback(String sortBy, String sortOrder)) {
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
      context: context,
      builder: (BuildContext bc) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              child: Wrap(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(16.0),
                    alignment: Alignment.center,
                    child: Text(
                      'Sort',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                  ),
                  ListTile(
                      trailing: Icon(Icons.keyboard_arrow_right),
                      dense: true,
                      title: Text('A-Z (Name)'),
                      onTap: () => {
                        callback(SortByEnum.lowercaseDescription.name, SortOrderEnum.asc.name),
                        Navigator.pop(context)
                      }),
                  ListTile(
                      trailing: Icon(Icons.keyboard_arrow_right),
                      dense: true,
                      title: Text('Z-A (Name)'),
                      onTap: () => {
                        callback(SortByEnum.lowercaseDescription.name, SortOrderEnum.desc.name),
                        Navigator.pop(context)
                      }),
                  ListTile(
                      trailing: Icon(Icons.keyboard_arrow_right),
                      dense: true,
                      title: Text('A-Z (Brand Name)'),
                      onTap: () => {
                        callback(SortByEnum.brandOwner.name, SortOrderEnum.asc.name),
                        Navigator.pop(context)
                      }),
                  ListTile(
                      trailing: Icon(Icons.keyboard_arrow_right),
                      dense: true,
                      title: Text('Z-A (Brand Name)'),
                      onTap: () => {
                        callback(SortByEnum.brandOwner.name, SortOrderEnum.desc.name),
                        Navigator.pop(context)
                      }),
                  ListTile(
                      trailing: Icon(Icons.keyboard_arrow_right),
                      dense: true,
                      title: Text('A-Z (Score)'),
                      onTap: () => {
                        callback(SortByEnum.score.name, SortOrderEnum.asc.name),
                        Navigator.pop(context)
                      }),
                  ListTile(
                      trailing: Icon(Icons.keyboard_arrow_right),
                      dense: true,
                      title: Text('Z-A (Score)'),
                      onTap: () => {
                        callback(SortByEnum.score.name, SortOrderEnum.desc.name),
                        Navigator.pop(context)
                      }),
                ],
              ),
            );
          },
        );
      });
}