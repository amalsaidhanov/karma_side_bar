import 'dart:convert';
import 'package:flutter/material.dart';
import '../../../../widget/karma_side_bar.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const jsonString = '''
    {
      "name": "Root Access",
      "description": "Root level access description",
      "img":  "http://localhost:8080/api/upload/svg?file=align-left.svg",
      "permissions": [],
      "children": [
        {
          "name": "Child Access 1",
          "description": "First child access description",
          "img":  "http://localhost:8080/api/upload/svg?file=align-left.svg",
          "permissions": [],
          "children": [
            {
              "name": "Sub Child Access 1.1",
              "description": "First sub child access description",
              "img":  "http://localhost:8080/api/upload/svg?file=align-left.svg",
              "permissions": [],
              "children": []
            },
            {
              "name": "Sub Child Access 1.2",
              "description": "Second sub child access description",
              "img":  "http://localhost:8080/api/upload/svg?file=align-left.svg",
              "permissions": [],
              "children": []
            }
          ]
        },
        {
          "name": "Child Access 2",
          "description": "Second child access description",
          "img":  "http://localhost:8080/api/upload/svg?file=align-left.svg",
          "permissions": [],
          "children": [
            {
              "name": "Sub Child Access 2.1",
              "description": "First sub child access description",
              "img":  "http://localhost:8080/api/upload/svg?file=align-left.svg",
              "permissions": [],
              "children": []
            },
            {
              "name": "Sub Child Access 2.2",
              "description": "Second sub child access description",
              "img":  "http://localhost:8080/api/upload/svg?file=align-left.svg",
              "permissions": [],
              "children": []
            }
          ]
        },
        {
          "name": "Child Access 3",
          "description": "Third child access description",
          "img":  "http://localhost:8080/api/upload/svg?file=align-left.svg",
          "permissions": [],
          "children": []
        }
      ]
    }
    ''';

    // Функция для парсинга JSON строки в объект SelectionModel
    SelectionModel rootItem = SelectionModel.fromJson(json.decode(jsonString));

    List<SelectionModel> items = [rootItem];

    void onItemSelected(String name) {
      print('Selected Item: $name');
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          children: [
            KarmaSideBar(
              items: items,
              onItemSelected: onItemSelected,
              selectedItem: 'Sub Child Access 1.1',
              isOpened: false,
              spacing: 40.0,
              backgroundColor: Colors.white,
              shadowColor: Colors.black12,
              dividerColor: Colors.grey,
              borderRadius: 32.0,
              iconSize: 20.0,
              itemPadding: 4.0,
              headerTextStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              grounditemTextStyle: const TextStyle(
                fontSize: 16,
              ),
              childItemTextStyle: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.grey[200],
                child: const Center(
                  child: Text(
                    'Content Area',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
