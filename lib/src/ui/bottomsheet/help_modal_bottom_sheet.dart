import 'package:flutter/material.dart';

void helpModalBottomSheet(context) {
  showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
      context: context,
      builder: (BuildContext bc) {
        return StatefulBuilder(
          builder: (BuildContext context,
              StateSetter setState /*You can rename this!*/) {
            return Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Wrap(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(16.0),
                    alignment: Alignment.center,
                    child: Text(
                      'Help',
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
                        RichText(
                          text: TextSpan(
                              text: '',
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Branded Foods',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text:
                                    ' formerly hosted on the USDA Food Composition Databases website, are data from a public-private partnership that provides values for nutrients in branded and private label foods that appear on the product label. Information in Branded Foods is received from food industry data providers.',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal))
                              ]),
                        ),
                        Padding(padding: EdgeInsets.only(top: 16)),
                        RichText(
                          text: TextSpan(
                              text: '',
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Foundation Foods',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text:
                                    ' includes values for nutrients and other food components on a diverse range of foods and ingredients as well as extensive underlying metadata. These metadata include the number of samples, sampling location, date of collection, analytical approaches used, and if appropriate, agricultural information such as genotype and production practices.',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal))
                              ]),
                        ),
                        Padding(padding: EdgeInsets.only(top: 16)),
                        RichText(
                          text: TextSpan(
                              text: '',
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'SR Legacy',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text:
                                    ' provides nutrient and food component values that are derived from analyses, calculations, and the published literature. SR Legacy, released in April 2018, is the final release of this data type and will not be updated.',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal))
                              ]),
                        ),
                        Padding(padding: EdgeInsets.only(top: 16)),
                        RichText(
                          text: TextSpan(
                              text: '',
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(
                                    text:
                                    'Survey (FNDDS - Food and Nutrient Database for Dietary Studies)',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text:
                                    ' contains data on the nutrient and food component values and weights for foods and beverages reported in the What We Eat in America dietary survey component of the National Health and Nutrition Examination Survey.',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal))
                              ]),
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