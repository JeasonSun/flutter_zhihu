import 'package:flutter/material.dart';

class LoadingContainer extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  final bool cover;

  const LoadingContainer({Key key, this.isLoading, this.cover, this.child})
      : super(key: key);

  Widget get _loadingView {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (cover) {
      return Stack(
        children: <Widget>[
          child,
          isLoading ? _loadingView : SizedBox(),
        ],
      );
    } else {
      return isLoading ? child : _loadingView;
    }
  }
}
