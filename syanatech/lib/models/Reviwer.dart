class Reviewer {
  final String name;
  final String content;
  final int stars; // Change it later to double
  final String url;

  Reviewer({
    required this.name,
    required this.content,
    required this.stars,
    this.url = '../images/avatar.jpg',
  });
}
