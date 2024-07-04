import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



class KarmaSideBar extends StatefulWidget {
  final List<SelectionModel> items;
  final void Function(String name) onItemSelected;
  final String selectedItem;
  final bool isOpened;
  final double spacing;
  final Color backgroundColor;
  final Color shadowColor;
  final Color dividerColor;
  final double closedSize;
  final double openedSize;
  final double borderRadius;
  final double iconSize;
  final double itemPadding;
  final TextStyle? headerTextStyle;
  final TextStyle? grounditemTextStyle;
  final TextStyle? childItemTextStyle;

  const KarmaSideBar({
    Key? key,
    required this.items,
    required this.onItemSelected,
    required this.selectedItem,
    this.isOpened = true,
    this.spacing = 10.0,
    this.backgroundColor = Colors.white,
    this.shadowColor = Colors.black12,
    this.dividerColor = Colors.grey,
    this.closedSize = 90,
    this.openedSize = 250,
    this.borderRadius = 32.0,
    this.iconSize = 20.0,
    this.itemPadding = 8.0,
    this.headerTextStyle,
    this.grounditemTextStyle,
    this.childItemTextStyle,

  }) : super(key: key);

  @override
  _KarmaSideBarState createState() => _KarmaSideBarState();
}

class _KarmaSideBarState extends State<KarmaSideBar> with TickerProviderStateMixin {
  bool _inAnimation = false;
  bool _expanded = true;
  String _onHoverItem = '';
  String _selectedItem = '';
  Set<String> _expandedItems = {};

  @override
  void initState() {
    _expanded = widget.isOpened;
    _selectedItem = widget.selectedItem;
    super.initState();
  }

  void _resize() {
    setState(() {
      _expanded = !_expanded;
      _inAnimation = true;
    });
  }

  void _setInAnimation(bool value) {
    setState(() {
      _inAnimation = value;
    });
  }

  void _setOnHover(String name) {
    setState(() {
      _onHoverItem = name;
    });
  }

  void _setExitHover() {
    setState(() {
      _onHoverItem = '';
    });
  }

  void _setSelectedItem(String name) {
    setState(() {
      _selectedItem = name;
    });
  }

  void _toggleExpandedItem(String name) {
    setState(() {
      if (_expandedItems.contains(name)) {
        _expandedItems.remove(name);
      } else {
        _expandedItems.add(name);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: const EdgeInsets.all(4),
      width: _expanded ? widget.openedSize : widget.closedSize,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubicEmphasized,
      onEnd: () => _setInAnimation(false),
      child: _buildFrame(),
    );
  }

  Widget _buildFrame() {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
        boxShadow: [
          BoxShadow(
            color: widget.shadowColor,
            spreadRadius: 0,
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: _buildChild(),
    );
  }

  Widget _buildChild() {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildHeader(),
          Container(
            margin: const EdgeInsets.only(top: 16, bottom: 24),
            height: 1,
            color: widget.dividerColor,
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return ConstrainedBox(
                  constraints: constraints,
                  child: SingleChildScrollView(
                    child: Column(
                      children: _buildMenuItems(),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 16, bottom: 24),
            height: 1,
            color: widget.dividerColor,
          ),
          SizedBox(height: 10),
          _buildSwitchButton(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: widget.itemPadding),
      height: 64,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.ac_unit_sharp,
            color: Theme.of(context).colorScheme.secondary,
            size: 30,
          ),
          _expanded || _inAnimation
              ? Flexible(
            child: Text(
              'Mao Mao Admin',
              overflow: TextOverflow.fade,
              maxLines: 1,
              softWrap: false,
              style: widget.headerTextStyle ?? Theme.of(context).textTheme.bodyLarge,
            ),
          )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }

  List<Widget> _buildMenuItems() {
    return widget.items.expand((item) {
      if (item.children.isNotEmpty) {
        return [
          _buildMultiItem(item),
          SizedBox(height: widget.spacing),
        ];
      } else {
        return [
          _buildSingleItem(item, false, false),
          SizedBox(height: widget.spacing),
        ];
      }
    }).toList();
  }

  Widget _buildSingleItem(SelectionModel item, bool isChild, bool isHeader) {
    Color? color = item.name == _selectedItem
        ? Theme.of(context).colorScheme.primary.withOpacity(0.3)
        : (item.name == _onHoverItem
        ? Theme.of(context).colorScheme.primary.withOpacity(0.3)
        : Colors.transparent);

    bool isExpanded = _expandedItems.contains(item.name);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onHover: (_) => _setOnHover(item.name),
      onExit: (_) => _setExitHover(),
      child: GestureDetector(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: widget.itemPadding),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: isHeader && isExpanded
                ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
                : color,
          ),
          child: Row(
            children: [
              SvgPicture.network(
                item.img,
                width: widget.iconSize,
                height: widget.iconSize,
                fit: BoxFit.cover,
                color: Theme.of(context).iconTheme.color,
              ),
              SizedBox(width: 8),
              _expanded || _inAnimation
                  ? Flexible(
                child: SizedBox(
                  width: 160,
                  child: Text(
                    item.name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: false,
                    style: isChild
                        ? widget.childItemTextStyle ??
                        Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(
                            color: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .color!
                                .withOpacity(0.6))
                        : widget.grounditemTextStyle ?? Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              )
                  : const SizedBox.shrink(),
              if (item.children.isNotEmpty) // Check if item has children
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: AnimatedRotation(
                    turns: isExpanded ? 0 : 0.25,
                    curve: Curves.easeInOutCubicEmphasized,
                    duration: const Duration(milliseconds: 500),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      size: 20,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                ),
            ],
          ),
        ),
        onTap: () {
          if (isHeader) {
            _toggleExpandedItem(item.name);
          } else {
            _setSelectedItem(item.name);
            widget.onItemSelected(item.name);
          }
        },
      ),
    );
  }

  Widget _buildMultiItem(SelectionModel item) {
    List<Widget> childItems = [];
    for (var child in item.children) {
      if (child.children.isNotEmpty) {
        childItems.add(_buildMultiChildItem(child));
      } else {
        childItems.add(SizedBox(height: widget.spacing / 2));
        childItems.add(_buildSingleItem(child, true, false));
      }
    }
    bool isExpanded = _expandedItems.contains(item.name);
    return Column(
      children: [
        _buildSingleItem(item, false, true),
        Container(
          margin: const EdgeInsets.only(left: 10),
          child: AnimatedSize(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOutCubicEmphasized,
            child: isExpanded
                ? Column(
              children: childItems,
            )
                : const SizedBox.shrink(),
          ),
        ),
      ],
    );
  }

  Widget _buildMultiChildItem(SelectionModel item) {
    List<Widget> grandChildItems = [];
    for (var grandChild in item.children) {
      grandChildItems.add(SizedBox(height: widget.spacing / 2));
      grandChildItems.add(_buildSingleItem(grandChild, true, false));
    }
    bool isExpanded = _expandedItems.contains(item.name);
    return Column(
      children: [
        SizedBox(height: widget.spacing / 2),
        _buildSingleItem(item, true, true),
        Container(
          margin: const EdgeInsets.only(left: 20),
          child: AnimatedSize(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOutCubicEmphasized,
            child: isExpanded
                ? Column(
              children: grandChildItems,
            )
                : const SizedBox.shrink(),
          ),
        ),
      ],
    );
  }

  IconButton _buildSwitchButton() {
    return IconButton(
      onPressed: () {
        setState(() {
          if (_inAnimation) return;
          _resize();
        });
      },
      icon: Icon(
        _expanded ? Icons.arrow_back_rounded : Icons.arrow_forward_rounded,
        color: _inAnimation ? Colors.transparent : Theme.of(context).iconTheme.color,
      ),
    );
  }
}

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
}