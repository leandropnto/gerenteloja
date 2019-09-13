import 'package:flutter/material.dart';
import 'package:gerenteloja/configs/styles.dart';

class UserTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'title',
        style: textoBranco,
      ),
      subtitle: Text(
        'subtitle',
        style: textoBranco,
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            'Pedidos: 0',
            style: textoBranco,
          ),
          Text(
            'Gasto: 0',
            style: textoBranco,
          ),
        ],
      ),
    );
  }
}
