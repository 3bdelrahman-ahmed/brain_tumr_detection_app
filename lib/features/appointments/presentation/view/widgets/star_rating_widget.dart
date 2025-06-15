import 'package:flutter/material.dart';

class StarRating extends StatefulWidget {
  final int maxStars;
  final double iconSize;
  final ValueChanged<int> onRatingChanged;
  final int initialRating;

  const StarRating({
    Key? key,
    this.maxStars = 5,
    this.iconSize = 32,
    required this.onRatingChanged,
    this.initialRating = 0,
  }) : super(key: key);

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  int _currentRating = 0;

  @override
  void initState() {
    super.initState();
    _currentRating = widget.initialRating;
  }

  void _handleTap(int index) {
    setState(() {
      _currentRating = index;
    });
    widget.onRatingChanged(index);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.maxStars, (index) {
        final isSelected = index < _currentRating;
        return GestureDetector(
          onTap: () => _handleTap(index + 1),
          child: Icon(
            isSelected ? Icons.star : Icons.star_border,
            color: Colors.amber,
            size: widget.iconSize,
          ),
        );
      }),
    );
  }
}
