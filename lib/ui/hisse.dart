import 'package:flutter/material.dart';
import 'package:flutter_currency/model/hisse_model.dart';
import 'package:flutter_currency/services/hisse_api.dart';

class HisseSayfa extends StatefulWidget {
  const HisseSayfa({Key? key}) : super(key: key);

  @override
  State<HisseSayfa> createState() => _HisseSayfaState();
}

class _HisseSayfaState extends State<HisseSayfa> {
  late Future<List<HisseModel>> _hisseListFeature;

  @override
  void initState() {
    super.initState();
    _hisseListFeature = HisseApi.getHisseData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<HisseModel>>(
      future: _hisseListFeature,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<HisseModel> _listem = snapshot.data!;

          return Container(
              child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.all(8.0),
                    itemCount: _listem.length,
                    itemBuilder: (BuildContext context, int index) {
                      var oankiHisse = _listem[index];
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    oankiHisse.text,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade200,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text("%" + oankiHisse.rate),
                                            if (double.parse(oankiHisse.rate) >
                                                0) ...[
                                              Icon(
                                                Icons.arrow_drop_up,
                                                color: Colors.green,
                                              ),
                                            ] else ...[
                                              Icon(
                                                Icons.arrow_drop_down,
                                                color: Colors.red,
                                              ),
                                            ]
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade200,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Text("Kapanış Fiyatı:" +
                                                  oankiHisse.lastpricestr +
                                                  " TL"),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ));
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
