import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  final saveFilters;
  final currentFilters;
  FilterScreen(this.currentFilters, this.saveFilters);
  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool glutenFree = false;
  bool vegetarian = false;
  bool vegan = false;
  bool lactoseFree = false;
  @override
  void initState() {
    glutenFree = widget.currentFilters['gluten'];
    lactoseFree = widget.currentFilters['lactose'];
    vegetarian = widget.currentFilters['vegetarian'];
    vegan = widget.currentFilters['vegan'];
    super.initState();
  }

  Widget buildSwitchListTile(
      String title, String description, bool currentValue, updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Filters'),
          actions: [
            IconButton(
                onPressed: () {
                  final selectedFilters = {
                    'gluten': glutenFree,
                    'lactose': lactoseFree,
                    'vegan': vegan,
                    'vegetarian': vegetarian
                  };
                  widget.saveFilters(selectedFilters);
                },
                icon: Icon(Icons.save))
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your Meal selection',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                buildSwitchListTile(
                    'gluten-free', 'only include gluten free meals', glutenFree,
                    (newValue) {
                  setState(() {
                    glutenFree = newValue;
                  });
                }),
                buildSwitchListTile('lactose-free',
                    'only include lactose free meals', lactoseFree, (newValue) {
                  setState(() {
                    lactoseFree = newValue;
                  });
                }),
                buildSwitchListTile(
                    'vegetarian', 'only include vegetarian meals', vegetarian,
                    (newValue) {
                  setState(() {
                    vegetarian = newValue;
                  });
                }),
                buildSwitchListTile('vegan', 'only include vegan meals', vegan,
                    (newValue) {
                  setState(() {
                    vegan = newValue;
                  });
                }),
              ],
            ))
          ],
        ));
  }
}
