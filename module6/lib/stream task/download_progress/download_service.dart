import 'dart:async';

class DownloadService {
  Stream<int> getProgressStream() {
    return Stream.periodic(
      const Duration(milliseconds: 150),
      (count) => count + 1,
    ).take(100);
  }
}