import 'package:brain_tumr_detection_app/core/utils/extenstions/responsive_design_extenstions.dart';
import 'package:flutter/material.dart';

class CustomToggleTabs extends StatefulWidget {
  final List<String> tabs;

  const CustomToggleTabs({Key? key, required this.tabs}) : super(key: key);

  @override
  _CustomToggleTabsState createState() => _CustomToggleTabsState();
}

class _CustomToggleTabsState extends State<CustomToggleTabs> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double tabWidth = screenWidth / widget.tabs.length;

    return Container(
      width: screenWidth, // Make container take full width
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.teal.shade100,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            left: selectedIndex * tabWidth, // Move indicator dynamically
            width: tabWidth,
            height: 40.h,
            curve: Curves.easeInOut,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.teal.shade700,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max, // Take full width
            children: List.generate(widget.tabs.length, (index) {
              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() => selectedIndex = index);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    // alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      widget.tabs[index],
                      style: TextStyle(
                        color: selectedIndex == index
                            ? Colors.white
                            : Colors.teal.shade900,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
