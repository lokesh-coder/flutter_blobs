import 'package:blobs/src/models.dart';

class BlobController {
  BlobData? Function()? _listener;
  BlobController();
  onChange(BlobData? Function() ex) {
    _listener = ex;
  }

  BlobData? change() => _listener != null ? _listener!() : null;

  dispose() {
    _listener = null;
  }
}
