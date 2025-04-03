import '/component/footer/footer_widget.dart';
import '/component/header_up/header_up_widget.dart';
import '/component/headerdown1/headerdown1_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'about_us_widget.dart' show AboutUsWidget;
import 'package:flutter/material.dart';

class AboutUsModel extends FlutterFlowModel<AboutUsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for headerUp component.
  late HeaderUpModel headerUpModel;
  // Model for headerdown1 component.
  late Headerdown1Model headerdown1Model;
  // Model for footer component.
  late FooterModel footerModel;

  @override
  void initState(BuildContext context) {
    headerUpModel = createModel(context, () => HeaderUpModel());
    headerdown1Model = createModel(context, () => Headerdown1Model());
    footerModel = createModel(context, () => FooterModel());
  }

  @override
  void dispose() {
    headerUpModel.dispose();
    headerdown1Model.dispose();
    footerModel.dispose();
  }
}
