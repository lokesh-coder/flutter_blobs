class InvalidHashIDException implements Exception {
  final String hashID;

  InvalidHashIDException(this.hashID);
  @override
  String toString() {
    return "Invalid hash ID - $hashID";
  }
}

class InvalidEdgesCountException implements Exception {
  @override
  String toString() {
    return "EdgesCount should be more than 2 and less than 300";
  }
}
