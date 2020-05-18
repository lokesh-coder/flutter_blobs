import 'package:blobs/src/models.dart';

class BlobController {
  BlobData Function() _listener;
  BlobController();
  onChange(BlobData Function() ex) {
    _listener = ex;
  }

  change() {
    if (_listener == null) return;
    return _listener();
  }

  dispose() {
    _listener = null;
  }
}
