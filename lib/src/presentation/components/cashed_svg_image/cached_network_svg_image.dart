import 'dart:isolate';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sample_bloc_mobile/src/config/router/app_routes.dart';

class CachedNetworkSvgImage extends StatelessWidget {
  const CachedNetworkSvgImage({
    super.key,
    required this.url,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.placeholderBuilder,
    this.errorBuilder,
    this.matchTextDirection = false,
    this.allowDrawingOutsideViewBox = false,
    this.semanticsLabel,
    this.excludeFromSemantics = false,
    this.clipBehavior = Clip.hardEdge,
    this.colorFilter,
  });

  final String url;
  final double? width;
  final double? height;
  final AlignmentGeometry alignment;
  final WidgetBuilder? placeholderBuilder;
  final WidgetBuilder? errorBuilder;
  final bool allowDrawingOutsideViewBox;
  final String? semanticsLabel;
  final Clip clipBehavior;
  final ColorFilter? colorFilter;
  final BoxFit fit;
  final bool matchTextDirection;
  final bool excludeFromSemantics;

  @override
  Widget build(BuildContext context) {
    if (url.isEmpty || !url.contains('.svg')) {
      return SizedBox(
        width: width,
        height: height,
        child: Center(
          child: errorBuilder == null
              ? const Icon(Icons.error)
              : errorBuilder!(context),
        ),
      );
    }
    if (url.contains('http') && url.contains('svg')) {
      return FutureBuilder<String>(
        future: getImage(),
        builder: (_, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            final String file = snapshot.data!;
            return SvgPicture.string(
              file,
              width: width,
              alignment: alignment,
              allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
              excludeFromSemantics: excludeFromSemantics,
              fit: fit,
              height: height,
              key: key,
              matchTextDirection: matchTextDirection,
              placeholderBuilder: placeholderBuilder,
              semanticsLabel: semanticsLabel,
              colorFilter: colorFilter,
            );
          }
          return SizedBox(
            width: width,
            height: height,
            child: Center(
              child: placeholderBuilder == null
                  ? const Icon(Icons.error)
                  : placeholderBuilder!(context),
            ),
          );
        },
      );
    }
    return SizedBox(
      width: width,
      height: height,
      child: Center(
        child: placeholderBuilder == null
            ? const Icon(Icons.error)
            : placeholderBuilder!(context),
      ),
    );
  }

  Future<String> getImage() async {
    if (localSource.getKey(url).isEmpty) {
      final String value = await image(url);
      await localSource.setKey(url, value);
      return value;
    } else {
      return localSource.getKey(url);
    }
  }
}

Future<String> image(String url) => Isolate.run<String>(
      () async {
        final Dio dio = Dio();
        final Response response = await dio.get(url);
        return response.data as String;
      },
    );
