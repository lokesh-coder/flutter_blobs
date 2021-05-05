class InvalidIDException implements Exception {
  final String? id;

  InvalidIDException(this.id);
  @override
  String toString() {
    return "Invalid ID - $id";
  }
}

class InvalidEdgesCountException implements Exception {
  @override
  String toString() {
    return "EdgesCount should be more than 2 and less than 300";
  }
}
