import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

final logger = Logger(
  printer: kReleaseMode ? null : PrettyPrinter(),
  level: kReleaseMode ? Level.off : Level.debug,
);