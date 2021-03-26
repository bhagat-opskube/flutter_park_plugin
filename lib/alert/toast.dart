
part of 'alert.dart';

showToast(
  message, {
  duration = const Duration(milliseconds: 5000),
  backgroundColor,
  textColor = Colors.white,
  textSize,
}) {

  if(ParkPlugin.navigatorKey==null)
    {
      throw "Plugin navigatorKey is not set";
    }
  var snackBar = SnackBar(
      duration: duration,
      elevation: 0,
      backgroundColor: Colors.transparent,
      behavior: SnackBarBehavior.floating,
      content: Container(
        decoration: BoxDecoration(color:backgroundColor??Colors.black.withOpacity(0.5), borderRadius: BorderRadius.circular(size_20)),
        margin: EdgeInsets.fromLTRB(0, 0, 0, size_32),
        padding: EdgeInsets.all(size_12),
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(color: textColor,fontSize: textSize??size_14),
        ),
      ));
   ScaffoldMessenger.of(ParkPlugin.navigatorKey!.currentContext!).showSnackBar(snackBar);

}

void removeFocus(context) {
    FocusScope.of(context).requestFocus(new FocusNode());
}