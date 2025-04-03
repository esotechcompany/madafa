import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'authentication_page_widget.dart' show AuthenticationPageWidget;
import 'package:flutter/material.dart';

class AuthenticationPageModel
    extends FlutterFlowModel<AuthenticationPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }
}
