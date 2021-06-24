# serenatarch

Serenat Arch

## Getting Started

Example
<pre>
<code>
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SeranatApp(
      debugShowCheckedModeBanner: false,
      initialState: SerenatState<MyState>(state: MyState()),
      initialPage: Page1(),
    );
  }
}

class MyState {
  String profilAvatar = "";
  String profilName = "";
  List<String> profilList = [];
}

class Page1 extends SerenatPage {
  Page1() : super(stateConnective: _Page1());
}

class _Page1 extends State<Page1> {
  TextEditingController controller = new TextEditingController();
  TextEditingController controllera = new TextEditingController();

  @override
  void setState(VoidCallback fn) {
    widget.setState!(fn);
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Sayfa1"),
          TextField(
            controller: controller,
            onChanged: (s) {
              (widget.viewBag!.state as MyState).profilList.add(s);
              (widget.viewBag!.state as MyState).profilName = s;
              setState(() {});
            },
          ),
          TextField(
            controller: controllera,
            onChanged: (s) {
              (widget.viewBag!.state as MyState).profilAvatar = s;
              setState(() {});
            },
          ),
          TextButton(
            onPressed: () {
              widget.push!(Page2());
            },
            child: Text("2"),
          )
        ],
      ),
    );
  }
}

class Page2 extends SerenatPage {
  Page2() : super(stateConnective: _Page2(), onReturnPage: Page1());
}

class _Page2 extends State<Page2> {
  @override
  void setState(VoidCallback fn) {
    widget.setState!(fn);
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Text("Sayfa22"),
          Text((widget.viewBag!.state as MyState).profilName),
          Container(
              width: 100,
              height: 100,
              child: Image.network(
                  (widget.viewBag!.state as MyState).profilAvatar)),
          ...(widget.viewBag!.state as MyState)
              .profilList
              .map((e) => Text(e))
              .toList(),
          TextButton(
            onPressed: () {
              widget.pop!();
            },
            child: Text("2"),
          )
        ],
      ),
    );
  }
}
</code>
</pre>
