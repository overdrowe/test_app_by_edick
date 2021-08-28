import 'package:flutter/foundation.dart';

class NavigationItem {
  final String name;
  final NavigationItemType type;
  final String iconUrl;

  const NavigationItem({
    required this.name,
    required this.type,
    required this.iconUrl,
  });

  static List<NavigationItem> all() {
    return [
      NavigationItem(
        name: 'Альбомы',
        type: NavigationItemType.albums,
        iconUrl: 'assets/icons/albums.svg',
      ),
      NavigationItem(
        name: 'Посты',
        type: NavigationItemType.posts,
        iconUrl: 'assets/icons/posts.svg',
      ),
      NavigationItem(
        name: 'Профиль',
        type: NavigationItemType.profile,
        iconUrl: 'assets/icons/profile.svg',
      ),
    ];
  }
}

enum NavigationItemType {
  albums,
  posts,
  profile,
}