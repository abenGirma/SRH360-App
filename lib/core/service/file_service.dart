import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:srh360app/core/helper/local_call.dart';
import 'package:srh360app/core/util/helper/error/api_failure.dart';
import 'package:srh360app/core/util/helper/logger.dart';
import 'package:srh360app/core/util/helper/type_def.dart';

class FileService {
  static FutureResult<Map<String, dynamic>> readJSON(
      {required String path}) async {
    try {
      final getFileContent = await LocalCalls.readFilesFromAssets(path);

      return getFileContent.fold(
        (l) {
          return Left(ApiFailure(message: "l.message"));
        },
        (r) {
          return Right(jsonDecode(r));
        },
      );
    } catch (e) {
      AppLogger.logError(
        "File Service",
        "Read JSON",
        e.toString(),
      );

      return Left(ApiFailure(message: e.toString()));
    }
  }

  static FutureResult<Map<String, dynamic>> readListFromJSON(
      {required String path}) async {
    try {
      final getFileContent = await LocalCalls.readFilesFromAssets(path);

      return getFileContent.fold(
        (l) {
          return Left(ApiFailure(message: "l.message"));
        },
        (r) {
          final data = json.decode(r);
          return Right(data);
        },
      );
    } catch (e) {
      AppLogger.logError(
        "File Service",
        "Read JSON",
        e.toString(),
      );

      return Left(ApiFailure(message: e.toString()));
    }
  }
}
