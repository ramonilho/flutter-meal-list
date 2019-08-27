import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final meal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    Widget buildSectionTitle(BuildContext context, String text) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 16),
        child: Text(
          text,
          style: Theme.of(context).textTheme.title,
        ),
      );
    }

    Widget buildContainer(Widget child) {
      return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(8),
        // height: 200,
        width: double.infinity,
        child: child,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('${meal.title}'),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Column(
                  children: <Widget>[
                    Container(
                      // height: 300,
                      width: double.infinity,
                      child: Image.network(
                        meal.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    buildSectionTitle(context, 'Ingredients'),
                    buildContainer(
                      ListView.builder(
                        itemCount: meal.ingredients.length,
                        itemBuilder: (ctx, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '• ${meal.ingredients[index]}',
                              style: TextStyle(fontSize: 16),
                            ),
                          );
                        },
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                      ),
                    ),
                    buildContainer(
                      ListView.builder(
                        itemCount: meal.steps.length,
                        itemBuilder: (ctx, index) => Column(
                          children: <Widget>[
                            ListTile(
                              leading: CircleAvatar(
                                child: Text('${(index + 1)}'),
                              ),
                              title: Text('${meal.steps[index]}'),
                            ),
                            Divider(),
                          ],
                        ),
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          Navigator.of(context).pop(mealId);
        },
      ),
    );
  }
}
