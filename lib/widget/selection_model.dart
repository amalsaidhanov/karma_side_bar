
class SelectionModel {
  final String name;
  final String description;
  final String img;
  final List<SelectionModel> children;

  SelectionModel({
    required this.name,
    required this.description,
    required this.img,
    this.children = const [],
  });

  factory SelectionModel.fromJson(Map<String, dynamic> json) {
    var childrenList = json['children'] as List? ?? [];
    List<SelectionModel> children = childrenList.map((child) => SelectionModel.fromJson(child)).toList();
    return SelectionModel(
      name: json['name'],
      description: json['description'],
      img: json['img'],
      children: children,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'img': img,
      'children': children.map((child) => child.toJson()).toList(),
    };
  }
}
