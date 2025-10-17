import 'dart:convert';
import 'dart:typed_data';

class CustomFile {
  CustomFile({
    required this.byte,
    required this.fileName,
    required this.filePath,
  });
  Uint8List byte;
  String fileName;
  String? filePath;

  String get toBase64 => 'data:application/pdf;base64,${base64.encode(byte)}';
}
