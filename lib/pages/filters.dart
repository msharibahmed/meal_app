import 'package:flutter/material.dart';
import 'package:meal_app/widgets/side_drawer.dart';

class Filters extends StatefulWidget {
  static const String namedRoute = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  Filters(this.currentFilters, this.saveFilters);
  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  // bool switchValue1 = false;
  bool switchValue1 = false;
  bool switchValue2 = false;
  bool switchValue3 = false;
  bool switchValue4 = false;
  // void _switchTap(bool value) {
  //   setState(() {
  //     switchValue = value;
  //   });
  // }
  @override
  void initState() {
    super.initState();
    switchValue1 = widget.currentFilters['gluten'];
    switchValue2 = widget.currentFilters['lactose'];
    switchValue3 = widget.currentFilters['vegan'];
    switchValue4 = widget.currentFilters['vegetarian'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                widget.saveFilters({
                  'gluten': switchValue1,
                  'lactose': switchValue2,
                  'vegan': switchValue3,
                  'vegetarian': switchValue4
                });
              })
        ],
      ),
      drawer: SideDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Center(
              child: Text('Adjust Your Meal Selection.',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Gluten-Free',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('Only include gluten-free meals')
                    ],
                  ),
                  Switch(
                      activeColor: Colors.deepOrangeAccent,
                      value: switchValue1,
                      onChanged: (value) => setState(() {
                            switchValue1 = value;
                          }))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lactose-Free',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('Only include lactose-free meals')
                    ],
                  ),
                  Switch(
                      activeColor: Colors.blue,
                      value: switchValue2,
                      onChanged: (value) => setState(() {
                            switchValue2 = value;
                          }))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Vegan',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('Only include vegan meals')
                    ],
                  ),
                  Switch(
                      value: switchValue4,
                      onChanged: (value) => setState(() {
                            switchValue4 = value;
                          }))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Vegetarian',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('Only include vegetarian meals')
                    ],
                  ),
                  Switch(
                      activeColor: Colors.green,
                      value: switchValue3,
                      onChanged: (value) => setState(() {
                            switchValue3 = value;
                          }))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
