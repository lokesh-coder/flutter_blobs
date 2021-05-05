import 'package:blobs/src/models.dart';

class BlobController {
  BlobData Function()? _listener;
  BlobController();
  onChange(BlobData Function() ex) {
    _listener = ex;
  }

  BlobData change() {
    if (_listener == null) return BlobData();
    return _listener!();
  }

  dispose() {
    _listener = null;
  }
}
