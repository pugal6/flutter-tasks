class Assignment {
  final String id;
  final String title;
  final String dueDate;
  final String course;
  final String description;
  final List<String> requirements;

  Assignment({
    required this.id,
    required this.title,
    required this.dueDate,
    required this.course,
    required this.description,
    required this.requirements,
  });
}