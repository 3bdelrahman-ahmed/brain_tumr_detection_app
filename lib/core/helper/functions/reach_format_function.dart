String reachFormat(int number) {
  if (number >= 1000000) {
    return "${(number / 1000000).toStringAsFixed(1)}M";
  } else if (number >= 100000) {
    return "${(number / 1000).round()}K";
  } else if (number >= 1000) {
    return "${(number / 1000).toStringAsFixed(1)}K";
  } else {
    return number.toString();
  }
}
