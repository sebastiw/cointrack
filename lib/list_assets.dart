import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'asset.dart';
import 'coincap.dart';

class ListAssets extends StatefulWidget {
  @override
  _ListAssetsState createState() => _ListAssetsState();
}

class _ListAssetsState extends State<ListAssets> {
  final CoinCap cc = CoinCap();
  final _data = <Asset>[];

  @override
  void initState() {
    super.initState();
    cc.assets().then((values) => _data.addAll(values));
  }

  Widget _buildListItem(String word, BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(word),
      ),
    );
  }

  Future _refreshData() async {
    await Future.delayed(Duration(seconds: 3));
    _data.clear();
    cc.assets().then((values) => _data.addAll(values));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Assets'),
      ),
      body: RefreshIndicator(
          onRefresh: _refreshData,
          child: ListView.builder(
            itemBuilder: (context, index) {
              Asset asset = _data[index];
              return _buildListItem(asset.toString(), context);
            },
            itemCount: _data.length,
          )),
    );
  }
}
