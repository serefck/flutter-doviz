import 'package:flutter/material.dart';
import 'package:flutter_currency/model/altin_model.dart';
import 'package:flutter_currency/services/altin_api.dart';

class AltinSayfa extends StatefulWidget {
  const AltinSayfa({Key? key}) : super(key: key);

  @override
  State<AltinSayfa> createState() => _AltinSayfaState();
}

class _AltinSayfaState extends State<AltinSayfa> {
  late Future<List<AltinModel>> _altinListFeature;

  @override
  void initState() {
    super.initState();
    _altinListFeature = AltinApi.getAltinData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<AltinModel>>(
      future: _altinListFeature,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<AltinModel> _listem = snapshot.data!;

          return Container(
              child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.all(8.0),
                    itemCount: _listem.length,
                    itemBuilder: (BuildContext context, int index) {
                      var oankiAltin = _listem[index];
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
                                  if (oankiAltin.name.isNotEmpty) ...[
                                    Text(
                                      oankiAltin.name,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ] else ...[
                                    Text(
                                      oankiAltin.name,
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
                                        Text("%" + oankiAltin.rate),
                                        if (double.parse(oankiAltin.rate) >
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
                                                oankiAltin.buyingstr +
                                                " TL"),
                                            Text("Satış: " +
                                                oankiAltin.sellingstr +
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
