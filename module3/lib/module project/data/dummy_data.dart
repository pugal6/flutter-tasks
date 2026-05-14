import '../models/assignment.dart';
import '../models/course.dart';

List<Course> courses = [
  Course(
    id: '1',
    title: 'Flutter Development',
    instructor: 'John Doe',
    progress: 0.5,
    description: 'Learn Flutter from scratch.',
  ),
  Course(
    id: '2',
    title: 'Java Programming',
    instructor: 'Jane Smith',
    progress: 0.8,
    description: 'Master Java basics and collections.',
  ),
  Course(
    id: '3',
    title: 'UI/UX Design',
    instructor: 'Alice Johnson',
    progress: 0.3,
    description: 'Design beautiful interfaces.',
  ),
  Course(
    id: '4',
    title: 'Database Systems',
    instructor: 'Bob Brown',
    progress: 0.9,
    description: 'Learn SQL and database design.',
  ),
  Course(
    id: '5',
    title: 'System Design Basics',
    instructor: 'Eve Davis',
    progress: 0.1,
    description: 'Understand REST APIs and system architecture.',
  ),
  Course(
    id: '6',
    title: 'Python for Developers',
    instructor: 'Charlie White',
    progress: 0.6,
    description: 'Learn Python programming language.',
  ),
];

List<Assignment> assignments = [
  Assignment(
    id: '1',
    title: 'Flutter Navigation Project',
    dueDate: 'May 20',
    course: 'Flutter Development',

    description:
        'Build a StudyHub application that demonstrates multiple Flutter navigation techniques including GoRouter, stack navigation, tab navigation, and named routes.',

    requirements: [
      'Implement bottom tab navigation',
      'Use GoRouter for app routing',
      'Pass data between screens',
      'Create reusable widgets',
      'Add a custom 404 screen',
    ],
  ),

  Assignment(
    id: '2',
    title: 'Java Collections Task',
    dueDate: 'May 22',
    course: 'Java Programming',

    description:
        'Create a console-based student management system using Java collections such as ArrayList, HashMap, and Set.',

    requirements: [
      'Store student records',
      'Implement search functionality',
      'Use HashMap for quick lookup',
      'Demonstrate collection iteration',
      'Handle invalid input properly',
    ],
  ),

  Assignment(
    id: '3',
    title: 'UI Design Practice',
    dueDate: 'May 24',
    course: 'UI/UX Design',

    description:
        'Design a modern mobile dashboard screen with proper visual hierarchy, spacing, and reusable components.',

    requirements: [
      'Use consistent spacing',
      'Apply proper typography',
      'Create reusable cards',
      'Use modern color palette',
      'Design responsive layout',
    ],
  ),

  Assignment(
    id: '4',
    title: 'SQL Query Challenge',
    dueDate: 'May 25',
    course: 'Database Systems',

    description:
        'Write optimized SQL queries to manage and retrieve student, course, and enrollment information from a relational database.',

    requirements: [
      'Use JOIN operations',
      'Write aggregate queries',
      'Use GROUP BY correctly',
      'Apply filtering conditions',
      'Optimize query readability',
    ],
  ),

  Assignment(
    id: '5',
    title: 'REST API Architecture',
    dueDate: 'May 28',
    course: 'System Design Basics',

    description:
        'Design a RESTful API structure for an online learning platform including authentication, courses, and assignment endpoints.',

    requirements: [
      'Create REST endpoints',
      'Use proper HTTP methods',
      'Design request/response models',
      'Handle authentication flow',
      'Document API structure',
    ],
  ),

  Assignment(
    id: '6',
    title: 'Python File Handling',
    dueDate: 'May 30',
    course: 'Python for Developers',

    description:
        'Build a Python utility that reads, writes, and processes student data using text and CSV files.',

    requirements: [
      'Read CSV data',
      'Write processed output',
      'Handle file exceptions',
      'Use modular functions',
      'Validate input data',
    ],
  ),
];