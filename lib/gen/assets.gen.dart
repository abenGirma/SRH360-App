/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/HIV_logo.png
  AssetGenImage get hIVLogo =>
      const AssetGenImage('assets/images/HIV_logo.png');

  /// File path: assets/images/adolescence.png
  AssetGenImage get adolescence =>
      const AssetGenImage('assets/images/adolescence.png');

  /// File path: assets/images/back.png
  AssetGenImage get back => const AssetGenImage('assets/images/back.png');

  /// File path: assets/images/checkmark.svg
  String get checkmark => 'assets/images/checkmark.svg';

  /// File path: assets/images/family.jpg
  AssetGenImage get family => const AssetGenImage('assets/images/family.jpg');

  /// File path: assets/images/family_planning.jpeg
  AssetGenImage get familyPlanningJpeg =>
      const AssetGenImage('assets/images/family_planning.jpeg');

  /// File path: assets/images/family_planning.png
  AssetGenImage get familyPlanningPng =>
      const AssetGenImage('assets/images/family_planning.png');

  /// File path: assets/images/family_planning_new.svg
  String get familyPlanningNew => 'assets/images/family_planning_new.svg';

  /// File path: assets/images/happy_face.png
  AssetGenImage get happyFace =>
      const AssetGenImage('assets/images/happy_face.png');

  /// File path: assets/images/place_holder.png
  AssetGenImage get placeHolder =>
      const AssetGenImage('assets/images/place_holder.png');

  /// File path: assets/images/user.png
  AssetGenImage get user => const AssetGenImage('assets/images/user.png');

  /// List of all assets
  List<dynamic> get values => [
        hIVLogo,
        adolescence,
        back,
        checkmark,
        family,
        familyPlanningJpeg,
        familyPlanningPng,
        familyPlanningNew,
        happyFace,
        placeHolder,
        user
      ];
}

class $AssetsImgGen {
  const $AssetsImgGen();

  /// File path: assets/img/back.png
  AssetGenImage get back => const AssetGenImage('assets/img/back.png');

  /// File path: assets/img/user.png
  AssetGenImage get user => const AssetGenImage('assets/img/user.png');

  /// List of all assets
  List<AssetGenImage> get values => [back, user];
}

class $AssetsTranslationsGen {
  const $AssetsTranslationsGen();

  /// File path: assets/translations/am.json
  String get am => 'assets/translations/am.json';

  /// File path: assets/translations/en-US.json
  String get enUS => 'assets/translations/en-US.json';

  /// List of all assets
  List<String> get values => [am, enUS];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsImgGen img = $AssetsImgGen();
  static const $AssetsTranslationsGen translations = $AssetsTranslationsGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
