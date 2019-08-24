import 'package:flutter/material.dart';
import 'package:meals_project/dummy_data.dart';

import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(16),
      children: DUMMY_CATEGORIES
          .map(
            (categoryData) => CategoryItem(
              categoryData.id,
              categoryData.title,
              categoryData.color,
            ),
          )
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
    );
  }
}
