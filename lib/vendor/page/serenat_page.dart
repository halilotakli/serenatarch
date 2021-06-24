import 'package:flutter/material.dart';
import 'package:serenatarch/vendor/model/serenat_state.dart';

class SerenatPage<T> extends StatefulWidget {
  final State<SerenatPage> stateConnective;
  SerenatState<T>? viewBag;
  Function? setState;
  Function? onWillPop;
  Function? pop;
  Function? push;
  SerenatPage? onReturnPage;

  SerenatPage(
      {required this.stateConnective,
      this.viewBag,
      this.setState,
      this.onWillPop,
      this.pop,
      this.push,
      this.onReturnPage})
      : super();

  @override
  State<SerenatPage> createState() {
    return this.stateConnective;
  }
}
