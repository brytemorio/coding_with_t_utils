import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_utils/common/widgets/exports.dart';

import '../../../../utils/exports.dart';

/// A flexible and customizable header widget for use across various screens.
///
/// - [scaffoldKey] is required for managing the drawer on mobile.
class TAdminHeader extends StatelessWidget implements PreferredSizeWidget {
  const TAdminHeader({
    super.key,
    required this.scaffoldKey,
    this.title,
    this.leadingIcon,
    this.leadingOnPressed,
    this.actions = const [],
    this.profileImage,
    this.imageType,
    this.profileName,
    this.profileEmail,
    this.profileOnTap,
    this.showSearch = true,
    this.showMenu = true,
    this.loading = false,
    this.searchHint = 'Search anything...',
    this.showOrderIcon = true,
    this.showNotificationIcon = true,
    this.showSettingsIcon = true,
    this.onOrderPressed,
    this.onNotificationPressed,
    this.onSettingsPressed,
  });

  /// GlobalKey to access the Scaffold state for mobile drawer management.
  final GlobalKey<ScaffoldState> scaffoldKey;

  /// Customizable title widget (e.g., a Text widget or custom widget).
  final Widget? title;

  /// Custom leading icon and its onPressed callback.
  final IconData? leadingIcon;
  final VoidCallback? leadingOnPressed;

  /// Custom actions for the header, such as icons/buttons.
  final List<Widget> actions;

  /// Profile image URL (optional) to display in the header.
  final ImageType? imageType;

  /// Profile image URL (optional) to display in the header.
  final String? profileImage;

  /// Profile name (optional) to display in the header.
  final String? profileName;

  /// Profile email (optional) to display in the header.
  final String? profileEmail;

  /// Route to navigate to when the profile is tapped.
  final void Function()? profileOnTap;

  /// Flag to enable or disable the search bar.
  final bool showSearch;

  /// Flag to enable or disable the menu button on mobile.
  final bool showMenu;

  /// Flag to enable or disable the loader.
  final bool loading;

  /// Hint text for the search bar.
  final String searchHint;

  /// Flags to show or hide specific icons in the header
  final bool showOrderIcon;
  final bool showNotificationIcon;
  final bool showSettingsIcon;

  /// Optional callbacks for the icons' onPressed actions
  final VoidCallback? onOrderPressed;
  final VoidCallback? onNotificationPressed;
  final VoidCallback? onSettingsPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: TColors().white,
        border: Border(bottom: BorderSide(color: TColors().grey, width: 1)),
      ),
      padding: EdgeInsets.symmetric(horizontal: TSizes().md, vertical: TSizes().sm),
      child: TAppBar(
        leadingIcon: showMenu && !TDeviceUtils.isDesktopScreen(context) ? Iconsax.menu : leadingIcon,
        leadingOnPressed:
            showMenu && !TDeviceUtils.isDesktopScreen(context) ? () => scaffoldKey.currentState?.openDrawer() : leadingOnPressed,
        title: Row(
          children: [
            // Conditionally show search field on desktop
            if (showSearch && TDeviceUtils.isDesktopScreen(context))
              SizedBox(
                width: 600,
                child: TextFormField(
                  decoration: InputDecoration(prefixIcon: Icon(Iconsax.search_normal), hintText: searchHint),
                ),
              ),
            if (title != null) title!, // Custom title
          ],
        ),
        actions: [
          ...actions,

          // Conditionally show Order icon
          if (showOrderIcon)
            TIcon(
              onPressed: onOrderPressed,
              icon: Iconsax.box,
              backgroundColor: TColors().primary.withValues(alpha: 0.1),
              color: TColors().primary,
            ),
          SizedBox(width: TSizes().spaceBtwItems / 2),

          // Conditionally show Notification icon
          if (showNotificationIcon)
            TIcon(
              onPressed: onNotificationPressed,
              icon: Iconsax.notification,
              backgroundColor: TColors().primary.withValues(alpha: 0.1),
              color: TColors().primary,
            ),
          SizedBox(width: TSizes().spaceBtwItems / 2),

          // Conditionally show Settings icon
          if (showSettingsIcon)
            TIcon(
              onPressed: onSettingsPressed,
              icon: Iconsax.setting,
              backgroundColor: TColors().primary.withValues(alpha: 0.1),
              color: TColors().primary,
            ),
          SizedBox(width: TSizes().spaceBtwItems / 2),

          // Profile section
          TContainer(
            showRipple: true,
            onTap: profileOnTap,
            padding: EdgeInsets.symmetric(horizontal: TSizes().sm, vertical: TSizes().xs),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TImage(
                  width: 40,
                  height: 40,
                  imageType: imageType ?? (profileImage != null ? ImageType.network : ImageType.asset),
                  image: profileImage ?? 'packages/t_utils/assets/user.png',
                ),

                if (!TDeviceUtils.isMobileScreen(context)) SizedBox(width: TSizes().sm),

                // Display profile name and email if available
                if (!TDeviceUtils.isMobileScreen(context))
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    spacing: TSizes().spaceBtwItems / 2,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (loading) const TShimmer(width: 50, height: 11),
                      if (loading) const TShimmer(width: 140, height: 11),
                      if (!loading) Text(profileName ?? '', style: Theme.of(context).textTheme.titleLarge),
                      if (!loading) Text(profileEmail ?? '', style: Theme.of(context).textTheme.labelMedium),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight() + 15);
}
