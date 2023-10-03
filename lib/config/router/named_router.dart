class Routes {
  static const layOutRouter = 'LAYOUT_ROUTER';
}

abstract class NamedNavigator {
  Future push(String routeName,
      {dynamic arguments, bool replace = false, bool clean = false});

  void pop({dynamic result});
}
