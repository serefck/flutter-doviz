import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_currency/services/doviz_api.dart';
import 'package:flutter_currency/ui/altin.dart';
import 'package:flutter_currency/ui/doviz.dart';
import 'package:flutter_currency/ui/haber.dart';
import 'package:flutter_currency/ui/hisse.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DovizApi.getDovizData();
    return MaterialApp(
      title: 'Material App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int secilenMenuItem = 0;
  late List<Widget> tumSayfalar;
  late DovizSayfa sayfaDoviz;
  late AltinSayfa sayfaAltin;
  late HisseSayfa sayfaHisse;
  late HaberSayfa sayfaHaber;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sayfaDoviz = DovizSayfa();
    sayfaAltin = AltinSayfa();
    sayfaHisse = HisseSayfa();
    sayfaHaber = HaberSayfa();

    tumSayfalar = [sayfaDoviz, sayfaAltin, sayfaHisse, sayfaHaber];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Döviz Kuru Uygulaması"),
      ),
      body: tumSayfalar[secilenMenuItem],
      bottomNavigationBar: BottomNavMenu(),
    );
  }

  ConvexAppBar BottomNavMenu() {
    return ConvexAppBar(
      items: [
        TabItem(icon: Icons.attach_money, title: 'Döviz'),
        TabItem(icon: Icons.circle_rounded, title: 'Altın'),
        TabItem(icon: Icons.pie_chart_sharp, title: 'Hisse'),
        TabItem(icon: Icons.folder, title: 'Haberler'),
      ],
      onTap: (index) {
        setState(() {
          secilenMenuItem = index;
        });
      },
    );
  }
}
