extension StringExtension on String {
  String toTitleCase() {
    title(s) => "${s[0].toUpperCase()}${s.substring(1).toLowerCase()}";
    return split(" ").map(title).join(" ");
  }
}
