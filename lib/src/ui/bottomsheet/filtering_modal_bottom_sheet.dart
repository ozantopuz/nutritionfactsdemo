import 'package:flutter/material.dart';
import 'package:nutritionfactsdemo/src/models/data_types.dart';

void filteringModalBottomSheet(context, DataTypes dataTypes, String brandName,
    callback(DataTypes dataTypes, String brandName)) {
  final brandNameController = TextEditingController();
  brandNameController.text = brandName;
  showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
      context: context,
      builder: (BuildContext bc) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Wrap(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(16.0),
                    alignment: Alignment.center,
                    child: Text(
                      'Filter',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16.0, bottom: 16.0),
                    child: Column(
                      children: [
                        Wrap(
                          spacing: 16.0,
                          children: [
                            FilterChip(
                              label: Text("Branded"),
                              padding: EdgeInsets.all(0.0),
                              labelStyle: TextStyle(
                                  color: Theme.of(context).primaryColor),
                              backgroundColor: Theme.of(context).accentColor,
                              selectedColor: Theme.of(context).accentColor,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              selected: dataTypes.isBrandedSelected,
                              onSelected: (bool selected) {
                                setState(() {
                                  dataTypes.isBrandedSelected = selected;
                                });
                              },
                            ),
                            FilterChip(
                              label: Text("Foundation"),
                              labelStyle: TextStyle(
                                  color: Theme.of(context).primaryColor),
                              backgroundColor: Theme.of(context).accentColor,
                              selectedColor: Theme.of(context).accentColor,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              selected: dataTypes.isFoundationSelected,
                              onSelected: (selected) {
                                setState(() {
                                  dataTypes.isFoundationSelected = selected;
                                });
                              },
                            ),
                            FilterChip(
                              label: Text("SR Legacy"),
                              labelStyle: TextStyle(
                                  color: Theme.of(context).primaryColor),
                              backgroundColor: Theme.of(context).accentColor,
                              selectedColor: Theme.of(context).accentColor,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              selected: dataTypes.isSRLegacySelected,
                              onSelected: (selected) {
                                setState(() {
                                  dataTypes.isSRLegacySelected = selected;
                                });
                              },
                            ),
                            FilterChip(
                              label: Text("Survey (FNDDS)"),
                              labelStyle: TextStyle(
                                  color: Theme.of(context).primaryColor),
                              backgroundColor: Theme.of(context).accentColor,
                              selectedColor: Theme.of(context).accentColor,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              selected: dataTypes.isSurveySelected,
                              onSelected: (selected) {
                                setState(() {
                                  dataTypes.isSurveySelected = selected;
                                });
                              },
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 16.0, bottom: 16.0),
                          child: TextField(
                            onEditingComplete: () =>
                                {FocusScope.of(context).unfocus()},
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor),
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context).primaryColor),
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
                                      {brandNameController.clear()},
                                  icon: Icon(Icons.clear,
                                      color: Theme.of(context).primaryColor),
                                ),
                                hintStyle: TextStyle(
                                    color: Theme.of(context).primaryColor),
                                hintText: "Type a brand name(Optional)",
                                fillColor: Theme.of(context).accentColor),
                            controller: brandNameController,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(16.0),
                          alignment: Alignment.center,
                          child: RaisedButton(
                            onPressed: () => {
                              callback(dataTypes, brandNameController.text),
                              Navigator.pop(context),
                              FocusScope.of(context).previousFocus()
                            },
                            textColor: Theme.of(context).accentColor,
                            color: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              "Search",
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        );
      });
}
