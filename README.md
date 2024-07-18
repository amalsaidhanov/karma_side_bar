![KarmaSideBar Logo](https://roszkowski.dev/images/2020-05-04/Flutter-logo-animation-v1-2.gif)





```markdown
# KarmaSideBar


**KarmaSideBar** is a customizable Flutter widget designed for seamless navigation between different pages of your app, with support for multi-level navigation and a sleek, customizable appearance.

## ✨ Features

- 🚀 Expandable/collapsible sidebar
- 📚 Multi-level navigation
- 🎨 Customizable appearance
- 📂 Handles nested menu items
- 🕹️ Smooth animations

## 🚀 Installation

Add the following to your `pubspec.yaml` file:

```yaml
dependencies:
  karma_side_bar_flutter:
    git:
      url: git@github.com:inskarma/karma_side_bar.git
```

## 🛠️ Usage

### Example JSON Structure

The following JSON structure represents the hierarchy of menu items used in the `KarmaSideBar`:

```dart
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
```

### Usage Example

Here is an example of how to use the `KarmaSideBar` widget in your Flutter project:

```dart
KarmaSideBar(
  items: items, // Items of the sidebar
  onItemSelected: onItemSelected, // Function called when an item is selected
  selectedItem: 'Sub Child Access 1.1', // Currently selected item
  isOpened: false, // State of the sidebar: opened or closed
  spacing: 40.0, // Spacing between items
  backgroundColor: Colors.white, // Background color of the sidebar
  shadowColor: Colors.black12, // Shadow color
  dividerColor: Colors.grey, // Divider color between items
  borderRadius: 32.0, // Border radius of the sidebar corners
  iconSize: 20.0, // Size of the icons
  itemPadding: 4.0, // Padding inside the items
  headerTextStyle: const TextStyle(
    fontSize: 18, // Font size for the header items
    fontWeight: FontWeight.bold, // Font weight for the header items
  ),
  grounditemTextStyle: const TextStyle(
    fontSize: 16, // Font size for the main items
  ),
  childItemTextStyle: const TextStyle(
    fontSize: 14, // Font size for the child items
    color: Colors.grey, // Text color for the child items
  ),
),
```


![Screenshot 2024-07-18 at 2 28 49 PM](https://github.com/user-attachments/assets/666f6c3a-0024-4a5a-a900-9b33c499376b)


![Screenshot 2024-07-18 at 2 27 20 PM](https://github.com/user-attachments/assets/c3c7b6bc-9a9c-430b-83d9-37142fafda04)





