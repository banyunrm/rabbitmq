import 'package:flutter/material.dart';
import 'package:flutter_package/home_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:mqtt_client/mqtt_client.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      // ignore: deprecated_member_use
      onModelReady: (model) => model.initState(),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text("Smart Watering "),
              centerTitle: true,
            ),
            body: Container(
              margin: EdgeInsets.all(5),
              height: 230,
              width: double.maxFinite,
              child: Card(
                elevation: 5,
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: Stack(
                                children: [
                              
                                 
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Icon(Icons.settings,
                                              color: Colors.green, size: 40),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "POMPA",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              text: model.pompa,
                                              style: TextStyle(
                                                  color: model.pompa == 'On'
                                                      ? Colors.green
                                                      : Colors.grey, fontSize: 30),
                                            ),
                                            textAlign: TextAlign.left,
                                          )
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          const Icon(
                                            Icons.waves,
                                            color: Colors.blue,
                                            size: 40,
                                          ),
                                          const Text(
                                            "NILAI SENSOR",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              text: model.value.toString(),
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 30,
                                              ),
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )),
      ),
    );
  }
}

 