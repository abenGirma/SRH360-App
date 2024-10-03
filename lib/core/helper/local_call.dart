import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:srh360app/core/util/helper/error/api_failure.dart';
import 'package:srh360app/core/util/helper/type_def.dart';

class LocalCalls {
  static FutureResult<String> readFilesFromAssets(String path) async {
    FutureResult<String> getFile(String path) async {
      var file = await rootBundle.loadString(path);
      if (file != "") {
        return Right(file);
      } else {
        return Left(ApiFailure(message: "file is empty"));
      }
    }

    var fetchedfile = await getFile(path);
    return fetchedfile.fold((l) {
      return Left(ApiFailure(message: "l.message"));
    }, (r) {
      return Right(r);
    });
  }
}
