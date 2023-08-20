import 'dart:io';

String fixture(String filename) =>
    File("test/features/fixtures/$filename").readAsStringSync();
