library xml_to_flutter_route;

import 'package:flutter/material.dart';

abstract class XmlWidgetElement {
  Widget construct(BuildContext context);
}

abstract class XmlWidget extends StatelessWidget implements XmlWidgetElement {
  XmlWidget({Key? key}) : super(key: key);
  final Map<String, XmlWidgetElement> params = {};

  void addParam(String paramName, XmlWidgetElement value);

  @override
  Widget construct(BuildContext context);
}

class XmlWidgetScaffold extends XmlWidget {
  XmlWidgetScaffold({Key? key}) : super(key: key);

  @override
  void addParam(String paramName, XmlWidgetElement value) {
    params.addAll({paramName: value});
  }

  @override
  Widget construct(BuildContext context) {
    return Scaffold(
      appBar: params['param_appbar']?.construct(context) as AppBar,
      body: params['param_body']?.construct(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return construct(context);
  }
}
