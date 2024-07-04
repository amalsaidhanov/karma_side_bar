# MyWidget

A custom Flutter widget.

## Installation

Add this to your package's pubspec.yaml file:

```yaml
dependencies:
  my_widget:
    git:
      url: git@github.com:amalsaidhanov1031/my_widget.git

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
    ''';# karma_side_bar
