import 'package:flutter/material.dart';
import 'package:flutter_currency/model/doviz_model.dart';
import 'package:flutter_currency/services/doviz_api.dart';

class DovizSayfa extends StatefulWidget {
  const DovizSayfa({Key? key}) : super(key: key);

  @override
  State<DovizSayfa> createState() => _DovizSayfaState();
}

class _DovizSayfaState extends State<DovizSayfa> {
  late Future<List<DovizModel>> _dovizListFeature;

  @override
  void initState() {
    super.initState();
    _dovizListFeature = DovizApi.getDovizData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DovizModel>>(
      future: _dovizListFeature,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<DovizModel> _listem = snapshot.data!;

          return Container(
              child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.all(8.0),
                    itemCount: _listem.length,
                    itemBuilder: (BuildContext context, int index) {
                      var oankiDoviz = _listem[index];
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                child: Text(
                                  oankiDoviz.code,
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (oankiDoviz.name.isNotEmpty) ...[
                                    Text(
                                      oankiDoviz.name,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ] else ...[
                                    Text(
                                      oankiDoviz.code,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text("%" + oankiDoviz.rate),
                                        if (double.parse(oankiDoviz.rate) >
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
                                ],
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.grey.shade200),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Alış: " +
                                                oankiDoviz.buyingstr +
                                                " TL"),
                                            Text("Satış: " +
                                                oankiDoviz.sellingstr +
                                                " TL"),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
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
