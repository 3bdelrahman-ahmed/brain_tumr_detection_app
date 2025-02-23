

extension SvgFixedExtension on String {
  String toSVG() =>
      'assets/svg/$this.svg';

}

extension PngFixedExtenstion on String {
  String toPng() =>
      'assets/image/$this.png';
} 

