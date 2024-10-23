import '/flutter_flow/flutter_flow_util.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for SihnUpEmail widget.
  FocusNode? sihnUpEmailFocusNode;
  TextEditingController? sihnUpEmailTextController;
  String? Function(BuildContext, String?)? sihnUpEmailTextControllerValidator;
  String? _sihnUpEmailTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for Signup-Password widget.
  FocusNode? signupPasswordFocusNode;
  TextEditingController? signupPasswordTextController;
  late bool signupPasswordVisibility;
  String? Function(BuildContext, String?)?
      signupPasswordTextControllerValidator;
  String? _signupPasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 7) {
      return 'Requires at least 7 characters.';
    }

    return null;
  }

  // State field(s) for signUpConfirmPassword widget.
  FocusNode? signUpConfirmPasswordFocusNode;
  TextEditingController? signUpConfirmPasswordTextController;
  late bool signUpConfirmPasswordVisibility;
  String? Function(BuildContext, String?)?
      signUpConfirmPasswordTextControllerValidator;
  String? _signUpConfirmPasswordTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 7) {
      return 'Requires at least 7 characters.';
    }

    return null;
  }

  // State field(s) for LoginEmail widget.
  FocusNode? loginEmailFocusNode;
  TextEditingController? loginEmailTextController;
  String? Function(BuildContext, String?)? loginEmailTextControllerValidator;
  // State field(s) for passWord widget.
  FocusNode? passWordFocusNode;
  TextEditingController? passWordTextController;
  late bool passWordVisibility;
  String? Function(BuildContext, String?)? passWordTextControllerValidator;

  @override
  void initState(BuildContext context) {
    sihnUpEmailTextControllerValidator = _sihnUpEmailTextControllerValidator;
    signupPasswordVisibility = false;
    signupPasswordTextControllerValidator =
        _signupPasswordTextControllerValidator;
    signUpConfirmPasswordVisibility = false;
    signUpConfirmPasswordTextControllerValidator =
        _signUpConfirmPasswordTextControllerValidator;
    passWordVisibility = false;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    sihnUpEmailFocusNode?.dispose();
    sihnUpEmailTextController?.dispose();

    signupPasswordFocusNode?.dispose();
    signupPasswordTextController?.dispose();

    signUpConfirmPasswordFocusNode?.dispose();
    signUpConfirmPasswordTextController?.dispose();

    loginEmailFocusNode?.dispose();
    loginEmailTextController?.dispose();

    passWordFocusNode?.dispose();
    passWordTextController?.dispose();
  }
}
