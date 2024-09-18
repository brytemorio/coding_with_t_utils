import 'dart:io';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/sizes.dart';
import '../shimmers/shimmer.dart';

class TRoundedImage extends StatelessWidget {
  const TRoundedImage({
    super.key,
    this.image,
    this.file,
    this.border,
    this.width = 56,
    this.height = 56,
    this.memoryImage,
    this.overlayColor,
    this.isNetworkImage = false,
    this.backgroundColor,
    this.padding,
    this.margin,
    this.fit = BoxFit.contain,
    this.applyImageRadius = true,
    this.borderRadius,
  });

  final bool applyImageRadius;
  final BoxBorder? border;
  final double? borderRadius;
  final BoxFit? fit;
  final String? image;
  final File? file;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final Uint8List? memoryImage;
  final double? width, height, padding;
  final double? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin != null ? EdgeInsets.all(margin!) : null,
      padding: EdgeInsets.all(padding ?? TSizes.sm),
      decoration: BoxDecoration(border: border, color: backgroundColor, borderRadius: BorderRadius.circular(borderRadius ?? TSizes.md)),
      child: _buildImageWidget(isNetworkImage),
    );
  }

  Widget _buildImageWidget(bool isNetworkImage) {
    // Apply ClipRRect directly to the image widget
    return ClipRRect(
      borderRadius: applyImageRadius ? BorderRadius.circular(borderRadius ?? TSizes.md) : BorderRadius.zero,
      child: isNetworkImage ? _buildNetworkImage() : _buildAssetImage(),
    );
  }

  // Function to build the network image widget
  Widget _buildNetworkImage() {
    if (image != null) {
      // Use CachedNetworkImage for efficient loading and caching of network images // Not working in Web but just for loading
      return CachedNetworkImage(
        fit: fit,
        imageUrl: image!,
        color: overlayColor,
        progressIndicatorBuilder: (context, url, downloadProgress) => TShimmerEffect(width: width ?? 50, height: height ?? 50),
        errorWidget: (context, url, error) => const Icon(Iconsax.image),
      );
    } else {
      // Return an empty container if no image is provided
      return Container();
    }
  }

  // Function to build the asset image widget
  Widget _buildAssetImage() {
    if (image != null) {
      // Display image from assets using Image widget
      return Image(fit: fit, image: AssetImage(image!), color: overlayColor);
    } else {
      // Return an empty container if no image is provided
      return Container();
    }
  }
}
