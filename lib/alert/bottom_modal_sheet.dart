
part of 'alert.dart';

class BottomModalSheet {

  static void yesNoBottomSheet(context, message, successMethod) {
    showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        builder: (BuildContext context) {
          return Container(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32.0),
                    child: new Text(
                      message,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  new Row(
                    children: <Widget>[
                      Expanded(
                          child: MaterialButton(
                        child: Text('No'),
                        padding: EdgeInsets.symmetric(
                          vertical: 16,
                        ),
                        color: Colors.grey[100],
                        colorBrightness: Brightness.light,
                        elevation: 2,
                        highlightElevation: 12,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                        onPressed: () {
                          //Do something
                          Navigator.pop(context);
                        },
                      )),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Container(
                            child: MaterialButton(
                          child: Text('Yes'),
                          padding: EdgeInsets.symmetric(
                            vertical: 16,
                          ),
                          color: AppTheme.appColor,
                          colorBrightness: Brightness.dark,
                          highlightElevation: 12,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                          onPressed: () {
                            Navigator.pop(context);
                            successMethod();
                            //Do something
                          },
                        )),
                      ),
                    ],
                  ),
                  new SizedBox(
                    height: 24.0,
                  )
                ],
              ),
            ),
          );
        });
  }

  static void logoutConfirmBottomSheet(context, onConfirm) {
    showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        builder: (BuildContext context) {
          return Container(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32.0),
                    child: new Text(
                      'Are you sure you want to log out?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  new Row(
                    children: <Widget>[
                      Expanded(
                          child: MaterialButton(
                        child: Text('Cancel'),
                        padding: EdgeInsets.symmetric(
                          vertical: 16,
                        ),
                        color: Colors.grey[100],
                        colorBrightness: Brightness.light,
                        elevation: 2,
                        highlightElevation: 12,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                        onPressed: () {
                          //Do something
                          Navigator.pop(context);
                        },
                      )),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Container(
                            child: MaterialButton(
                          child: Text('Log Out'),
                          padding: EdgeInsets.symmetric(
                            vertical: 16,
                          ),
                          color: AppTheme.appColor,
                          colorBrightness: Brightness.dark,
                          highlightElevation: 12,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6)),
                          onPressed: () {
                            Navigator.pop(context);
                            onConfirm();
                            //Do something
                          },
                        )),
                      ),
                    ],
                  ),
                  new SizedBox(
                    height: 24.0,
                  )
                ],
              ),
            ),
          );
        });
  }

  static void confirmBottomSheet(context, message,{confirmText="Confirm",onConfirm,cancelText="Cancel",onCancel})
  {
    showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        builder: (BuildContext context) {
          return Container(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 32.0),
                    child: new Text(
                      message,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  new Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                            child: MaterialButton(
                              child: Text(confirmText),
                              padding: EdgeInsets.symmetric(
                                vertical: 16,
                              ),
                              color: AppTheme.appColor,
                              colorBrightness: Brightness.dark,
                              highlightElevation: 12,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)),
                              onPressed: () {
                                Navigator.pop(context);
                                if(onConfirm!=null)
                                    onConfirm();
                                //Do something
                              },
                            )),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                          child: MaterialButton(
                            child: Text(cancelText),
                            padding: EdgeInsets.symmetric(
                              vertical: 16,
                            ),
                            color: Colors.grey[100],
                            colorBrightness: Brightness.light,
                            elevation: 2,
                            highlightElevation: 12,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)),
                            onPressed: () {
                              if(onCancel!=null)
                                onCancel();
                              Navigator.pop(context);

                            },
                          )),
                    ],
                  ),
                  new SizedBox(
                    height: 24.0,
                  )
                ],
              ),
            ),
          );
        });
  }

  static void pickerBottomSheet(context, {String message="Pick image from",onCameraSelect,onGallerySelect}) {
    showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(size_30), topRight: Radius.circular(size_30)),
        ),
        builder: (BuildContext context) {
          return Container(
            child: Padding(
              padding:  EdgeInsets.all(size_24),
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding:  EdgeInsets.only(bottom: size_32),
                    child: new Text(
                      message,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: size_16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  new Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                            child: MaterialButton(
                              child: Text("Camera"),
                              padding: EdgeInsets.symmetric(
                                vertical: size_16,
                              ),
                              color: AppTheme.appColor,
                              colorBrightness: Brightness.dark,
                              highlightElevation: 12,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(size_6)),
                              onPressed: () {
                                Navigator.pop(context);
                                if(onCameraSelect!=null)
                                  onCameraSelect();
                                //Do something
                              },
                            )),
                      ),
                      SizedBox(
                        width: size_16,
                      ),
                      Expanded(
                          child: MaterialButton(
                            child: Text("Gallery"),
                            padding: EdgeInsets.symmetric(
                              vertical: size_16,
                            ),
                            color: Colors.grey[100],
                            colorBrightness: Brightness.light,
                            elevation: 2,
                            highlightElevation: 12,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(size_6)),
                            onPressed: () {
                              //Do something
                              Navigator.pop(context);
                              if(onGallerySelect!=null)
                                onGallerySelect();
                            },
                          )),
                    ],
                  ),
                  new SizedBox(
                    height: size_24,
                  )
                ],
              ),
            ),
          );
        });
  }

  static void customChildSheet(context, child, {isCancelable: true}) {
    showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(size_30), topRight: Radius.circular(size_30)),
        ),
        builder: (BuildContext context) {
          return WillPopScope(
              onWillPop: () async {
                return isCancelable;
              },
              child: Padding(
                  padding: MediaQuery.of(context).viewInsets,child: child));
        });
  }

  static void openOkActionSheet(context, message,
      {okButtonText = "Ok", isCancelable: true,okClickListener}) {
    Future<void> future = showModalBottomSheet<void>(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(size_30), topRight: Radius.circular(size_30)),
        ),
        builder: (BuildContext context) {
          return  WillPopScope(
            onWillPop: () async {
              return isCancelable;
            },
            child: Container(
              child: Padding(
                padding:  EdgeInsets.all(size_24),
                child: new Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding:  EdgeInsets.only(bottom: size_16),
                      child: new Text(
                        message,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                    new Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                              child: MaterialButton(
                            child: Text(
                              okButtonText,
                              style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.white),
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: size_16,
                            ),
                            color: AppTheme.appColor,
                            colorBrightness: Brightness.dark,
                            highlightElevation: 12,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(size_6)),
                            onPressed: () {
                              //startUpload();
                              Navigator.pop(context);
                              okClickListener();
                              //Do something
                            },
                          )),
                        ),
                      ],
                    ),
                    new SizedBox(
                      height: size_24,
                    )
                  ],
                ),
              ),
            ),
          );
        });

//    future.then((void value) => okClickListener(param));
  }

  static void okBottomSheet(context, message, {isCancelable: true}) {
    showModalBottomSheet<void>(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(size_30), topRight: Radius.circular(size_30)),
        ),
        builder: (BuildContext context) {
          return WillPopScope(
              onWillPop: () async {
                return isCancelable;
              },
              child: SingleChildScrollView(
                child: Container(
                  child: Padding(
                    padding:  EdgeInsets.all(size_24),
                    child: !isCancelable
                        ? new Text(
                            message,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyText2,
                          )
                        : new Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(bottom: size_30),
                                child: new Text(
                                  message??"",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: size_16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              new Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: size_16,
                                  ),
                                  Expanded(
                                    child: Container(
                                        child: MaterialButton(
                                      child: Text('Ok',style: Theme.of(context).textTheme.headline3,),
                                      padding: EdgeInsets.symmetric(
                                        vertical: size_16,
                                      ),
                                      color: AppTheme.appColor,
                                      colorBrightness: Brightness.dark,
                                      highlightElevation: 12,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(size_6)),
                                      onPressed: () {
                                        //startUpload();
                                        Navigator.pop(context);
                                        //Do something
                                      },
                                    )),
                                  ),
                                ],
                              ),
                              new SizedBox(
                                height: size_24,
                              )
                            ],
                          ),
                  ),
                ),
              ));
        });
  }

}
