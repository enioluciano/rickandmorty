import 'dart:io';

String fixture(String name) => File('test/util/$name').readAsStringSync();
