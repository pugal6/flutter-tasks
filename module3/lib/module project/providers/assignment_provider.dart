import 'package:flutter/material.dart';

class AssignmentProvider extends ChangeNotifier {
  final Set<String> submittedAssignments = {};

  bool isSubmitted(String id) {
    return submittedAssignments.contains(id);
  }

  void submitAssignment(String id) {
    submittedAssignments.add(id);
    notifyListeners();
  }
}