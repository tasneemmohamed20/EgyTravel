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

  /// File path: assets/images/4.png
  AssetGenImage get a4 => const AssetGenImage('assets/images/4.png');

  /// File path: assets/images/6.png
  AssetGenImage get a6 => const AssetGenImage('assets/images/6.png');

  /// File path: assets/images/Lock.svg
  String get lock => 'assets/images/Lock.svg';

  /// File path: assets/images/OTP.svg
  String get otp => 'assets/images/OTP.svg';

  /// File path: assets/images/back_icon.svg
  String get backIcon => 'assets/images/back_icon.svg';

  /// File path: assets/images/chatbot.png
  AssetGenImage get chatbot => const AssetGenImage('assets/images/chatbot.png');

  /// File path: assets/images/checkCircle.svg
  String get checkCircle => 'assets/images/checkCircle.svg';

  /// File path: assets/images/flagEgypt.png
  AssetGenImage get flagEgypt =>
      const AssetGenImage('assets/images/flagEgypt.png');

  /// File path: assets/images/flagUn.png
  AssetGenImage get flagUn => const AssetGenImage('assets/images/flagUn.png');

  /// File path: assets/images/imagetest.png
  AssetGenImage get imagetest =>
      const AssetGenImage('assets/images/imagetest.png');

  /// File path: assets/images/login.jpeg
  AssetGenImage get login => const AssetGenImage('assets/images/login.jpeg');

  /// File path: assets/images/onboarding1.jpeg
  AssetGenImage get onboarding1 =>
      const AssetGenImage('assets/images/onboarding1.jpeg');

  /// File path: assets/images/onboarding2.jpeg
  AssetGenImage get onboarding2 =>
      const AssetGenImage('assets/images/onboarding2.jpeg');

  /// File path: assets/images/onboarding3.jpeg
  AssetGenImage get onboarding3 =>
      const AssetGenImage('assets/images/onboarding3.jpeg');

  /// File path: assets/images/openmoji_flag-egypt.png
  AssetGenImage get openmojiFlagEgypt =>
      const AssetGenImage('assets/images/openmoji_flag-egypt.png');

  /// File path: assets/images/profile.jpeg
  AssetGenImage get profile =>
      const AssetGenImage('assets/images/profile.jpeg');

  /// List of all assets
  List<dynamic> get values => [
        a4,
        a6,
        lock,
        otp,
        backIcon,
        chatbot,
        checkCircle,
        flagEgypt,
        flagUn,
        imagetest,
        login,
        onboarding1,
        onboarding2,
        onboarding3,
        openmojiFlagEgypt,
        profile
      ];
}

class $AssetsTranslationsGen {
  const $AssetsTranslationsGen();

  /// File path: assets/translations/ar-AE.json
  String get arAE => 'assets/translations/ar-AE.json';

  /// File path: assets/translations/en-US.json
  String get enUS => 'assets/translations/en-US.json';

  /// List of all assets
  List<String> get values => [arAE, enUS];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
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
    bool gaplessPlayback = false,
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
