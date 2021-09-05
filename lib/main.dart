import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_echarts/flutter_echarts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<Map<String, Object>> _data1 = [{ 'name': 'Please wait', 'value': 0 }];

  getData1() async {
    await Future.delayed(Duration(seconds: 1));

    const dataObj = [{
      'name': 'Jan',
      'value': 8726.2453,
    }, {
      'name': 'Feb',
      'value': 2445.2453,
    }, {
      'name': 'Mar',
      'value': 6636.2400,
    }, {
      'name': 'Apr',
      'value': 4774.2453,
    }, {
      'name': 'May',
      'value': 1066.2453,
    }, {
      'name': 'Jun',
      'value': 4576.9932,
    }, {
      'name': 'Jul',
      'value': 8926.9823,
    }];

    this.setState(() { this._data1 = dataObj;});
  }

  @override
  void initState() {
    super.initState();

    this.getData1();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('CoinTrack'),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                child: Echarts(
                  captureAllGestures: true,
                  theme: 'dark',
                  option: '''
                    {
                      tooltip: {
                          trigger: 'axis',
                          position: function (pt) {
                              return [pt[0], '100%'];
                          }
                      },
                      toolbox: {
                          feature: {
                              dataZoom: {
                                  yAxisIndex: 'none'
                              },
                              restore: {},
                              saveAsImage: {}
                          }
                      },
                      dataset: {
                        dimensions: ['name', 'value'],
                        source: ${jsonEncode(_data1)},
                      },
                      xAxis: {
                          type: 'category',
                          boundaryGap: false
                      },
                      yAxis: {
                          type: 'value',
                          boundaryGap: [0, '100%']
                      },
                      dataZoom: [{
                          type: 'inside',
                          start: 0,
                          end: 100
                      }, {
                          start: 0,
                          end: 100,
                          handleIcon: 'M10.7,11.9v-1.3H9.3v1.3c-4.9,0.3-8.8,4.4-8.8,9.4c0,5,3.9,9.1,8.8,9.4v1.3h1.3v-1.3c4.9-0.3,8.8-4.4,8.8-9.4C19.5,16.3,15.6,12.2,10.7,11.9z M13.3,24.4H6.7V23h6.6V24.4z M13.3,19.6H6.7v-1.4h6.6V19.6z',
                          handleSize: '80%',
                          handleStyle: {
                              color: '#fff',
                              shadowBlur: 3,
                              shadowColor: 'rgba(0, 0, 0, 0.6)',
                              shadowOffsetX: 2,
                              shadowOffsetY: 2
                          }
                      }],
                      series: [
                          {
                              name: 'data',
                              type: 'line',
                              smooth: true,
                              symbol: 'none',
                              sampling: 'average',
                              itemStyle: {
                                  color: 'rgb(255, 70, 131)'
                              },
                              areaStyle: {
                                  color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                      offset: 0,
                                      color: 'rgb(255, 158, 68)'
                                  }, {
                                      offset: 1,
                                      color: 'rgb(255, 70, 131)'
                                  }])
                              }
                          }
                      ]
                    }
                  ''',
                ),
                width: 300,
                height: 250,
              )
            ],
          ),
        ),
      ),
    );
  }
}
