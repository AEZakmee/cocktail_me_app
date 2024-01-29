enum SideNavigationPosition {
  leading,
  trailing;

  bool isInverted() {
    return this == SideNavigationPosition.trailing;
  }
}
