extension StringExtension on String? {
  String capitalize() {
    if (this?.isEmpty ?? false) return '';
    return '${this![0].toUpperCase()}${this!.substring(1).toLowerCase()}';
  }

  String camelCase() {
    if (this?.isEmpty ?? false) return '';
    return this!.split(' ').map((e) => e.capitalize()).join(' ');
  }
}
