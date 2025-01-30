import 'dart:io';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/enums.dart';
import '../loaders/shimmer.dart';

class TImage extends StatelessWidget {
  /// A customizable image widget with the option to display the image in a circular or rectangular shape.
  ///
  /// - [imageType] determines the source of the image (network, memory, file, or asset).
  /// - [applyImageRadius] decides whether the image should have rounded corners.
  /// - [width] and [height] set the dimensions of the image.
  /// - [overlayColor] applies a color overlay on top of the image.
  /// - [backgroundColor] is the color of the background behind the image.
  /// - [padding] and [margin] control the space around the image.
  /// - [borderRadius] allows for custom rounding of the image corners.
  /// - [imageShape] you can set imageShape either [BoxShape.circle] OR [BoxShape.rectangle].
  const TImage({
    super.key,
    this.image,
    this.file,
    this.border,
    this.width = 56,
    this.height = 56,
    this.memoryImage,
    this.overlayColor,
    required this.imageType,
    this.backgroundColor,
    this.padding,
    this.margin,
    this.fit = BoxFit.contain,
    this.applyImageRadius = true,
    this.borderRadius,
    this.imageShape = BoxShape.rectangle,
  });

  /// Whether the image should have rounded corners or be rectangular. [BoxShape.circle] for circular shape, [BoxShape.rectangle] for rectangular.
  final BoxShape imageShape;

  /// Whether to apply a border radius to the image corners. If true, the image corners will be rounded based on [borderRadius].
  final bool applyImageRadius;

  /// The border for the container around the image. Allows you to add a border around the image.
  final BoxBorder? border;

  /// The radius of the image corners when [applyImageRadius] is true. Used to control the roundness of the corners.
  final double? borderRadius;

  /// Determines how the image should be resized to fit within its container. [BoxFit.contain] by default, but can be customized.
  final BoxFit? fit;

  /// The URL of the image to be loaded from the network. This is used when [imageType] is [ImageType.network].
  final String? image;

  /// The image file to be loaded. This is used when [imageType] is [ImageType.file].
  final File? file;

  /// The type of image source (network, memory, file, or asset). Used to determine the correct widget to load the image from.
  final ImageType imageType;

  /// A color that is overlay on top of the image. This can be used to add a tint or filter effect to the image.
  final Color? overlayColor;

  /// The background color behind the image. This color will show behind the image when the image has transparency or is not provided.
  final Color? backgroundColor;

  /// Image data that is loaded into memory. This is used when [imageType] is [ImageType.memory].
  final Uint8List? memoryImage;

  /// The width of the image. If not provided, it defaults to 56.
  final double? width;

  /// The height of the image. If not provided, it defaults to 56.
  final double? height;

  /// The padding around the image inside its container. This is used to add space between the image and the container's edge.
  final double? padding;

  /// The margin around the image. This adds space around the container of the image itself.
  final double? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin != null ? EdgeInsets.all(margin!) : null,
      padding: EdgeInsets.all(padding ?? 8.0),
      decoration: BoxDecoration(
        border: border,
        shape: imageShape,
        color: backgroundColor,
        borderRadius: _getBorderRadius(),
      ),
      child: _buildImageWidget(),
    );
  }

  // Helper function to get border radius for circle or rectangle
  BorderRadius _getBorderRadius() {
    if (imageShape == BoxShape.rectangle) {
      return BorderRadius.circular(borderRadius ?? 8.0);
    } else if (imageShape == BoxShape.circle) {
      return BorderRadius.circular(
        _getCircleRadius(), // Use helper for circle radius
      );
    }
    return BorderRadius.circular(0);
  }

  // Helper function to calculate circle radius based on width and height
  double _getCircleRadius() {
    return width != null
        ? height != null
            ? width! >= height!
                ? width!
                : height!
            : width!
        : height ?? 100; // Default value for radius if no width/height is provided
  }

  // Builds the image widget based on the imageType
  Widget _buildImageWidget() {
    Widget imageWidget;

    switch (imageType) {
      case ImageType.network:
        imageWidget = _buildNetworkImage();
        break;
      case ImageType.memory:
        imageWidget = _buildMemoryImage();
        break;
      case ImageType.file:
        imageWidget = _buildFileImage();
        break;
      case ImageType.asset:
        imageWidget = _buildAssetImage();
        break;
    }

    return ClipRRect(
      borderRadius: applyImageRadius ? _getBorderRadius() : BorderRadius.circular(0),
      child: imageWidget,
    );
  }

  // Builds the network image widget
  Widget _buildNetworkImage() {
    if (image != null) {
      return CachedNetworkImage(
        imageUrl: image ?? '',
        fit: fit,
        color: overlayColor,
        width: width,
        height: height,
        placeholder: (context, url) => TShimmer(width: 56, height: 56, radius: borderRadius ?? 8.0),
        errorWidget: (context, url, error) => _errorImageWidget(),
      );
    } else {
      return _errorImageWidget();
    }
  }

  // Builds the memory image widget
  Widget _buildMemoryImage() {
    if (memoryImage != null) {
      return Image.memory(memoryImage!, fit: fit ?? BoxFit.contain, color: overlayColor);
    } else {
      return _errorImageWidget();
    }
  }

  // Builds the file image widget
  Widget _buildFileImage() {
    if (file != null) {
      return Image.file(file!, fit: fit ?? BoxFit.contain, color: overlayColor);
    } else {
      return _errorImageWidget();
    }
  }

  // Builds the asset image widget
  Widget _buildAssetImage() {
    if (image != null) {
      return Image.asset(image!, fit: fit ?? BoxFit.contain, color: overlayColor);
    } else {
      return _errorImageWidget();
    }
  }

  // Fallback error widget in case image fails to load
  Widget _errorImageWidget() {
    return const Icon(Iconsax.image5, color: Colors.red);
  }
}
