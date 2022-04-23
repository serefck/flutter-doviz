import 'package:flutter/material.dart';
import 'package:flutter_currency/model/haber_model.dart';
import 'package:flutter_currency/services/haber_api.dart';
import 'package:url_launcher/url_launcher.dart';

class HaberSayfa extends StatefulWidget {
  const HaberSayfa({Key? key}) : super(key: key);

  @override
  State<HaberSayfa> createState() => _HaberSayfaState();
}

class _HaberSayfaState extends State<HaberSayfa> {
  late Future<List<HaberModel>> _haberListFeature;

  @override
  void initState() {
    super.initState();
    _haberListFeature = HaberApi.getHaberData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<HaberModel>>(
      future: _haberListFeature,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<HaberModel> _listem = snapshot.data!;

          return Center(
            child: ListView.builder(
              itemCount: _listem.length,
              itemBuilder: (context, index) {
                var oankiHaber = _listem[index];
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Image.network(oankiHaber.image),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            oankiHaber.name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                fontFamily: ''),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(oankiHaber.description),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Kaynak: " + oankiHaber.source),
                              ElevatedButton(
                                  onPressed: () {
                                    launch(oankiHaber.url);
                                  },
                                  child: Text("Habere Git"))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text("hata geldi"),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
