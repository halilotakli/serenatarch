import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:serenatarch/vendor/model/serenat_state.dart';
import 'package:serenatarch/vendor/page/serenat_page.dart';

class SerenatMainPage extends StatefulWidget {
  const SerenatMainPage(
      {Key? key,
      required this.pageState,
      required this.initialPage,
      this.onExit})
      : super(key: key);
  final SerenatState pageState;
  final SerenatPage initialPage;
  final Function? onExit;

  @override
  State<SerenatMainPage> createState() => _SerenatMainPageState();
}

class _SerenatMainPageState extends State<SerenatMainPage> {
  late SerenatState viewBag;

  late SerenatPage page;


  @override
  void initState() {
    viewBag = widget.pageState;
    page = widget.initialPage;
    super.initState();
  }

  Future<bool> onWillPop() async {
    if (page.onWillPop != null) {
      page.onWillPop!();
    }
    if (page.onReturnPage != null) {
      push(page.onReturnPage!);
    } else {
      if (widget.onExit != null)
        widget.onExit!();
      else {
        showModalBottomSheet(
            context: context,
            builder: (_) {
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Are You Sure?",
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    ),
                    Text("Are you close this application?",
                        style: TextStyle(color: Colors.black, fontSize: 13)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(_);
                            },
                            child: Text("Cancel")),
                        TextButton(
                            onPressed: () {
                              SystemNavigator.pop();
                            },
                            child: Text("Yes")),
                      ],
                    )
                  ],
                ),
              );
            });
      }
    }
    return false;
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  pop() {
    onWillPop();
  }

  push(SerenatPage pageObj) {
    setState(() {
      page = pageObj;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: page
          ..viewBag = viewBag
          ..setState = setState
          ..pop = pop
          ..push = push,
        onWillPop: onWillPop);
  }
}
