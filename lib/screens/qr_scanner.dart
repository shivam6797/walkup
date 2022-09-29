import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRPay extends StatefulWidget {
  const QRPay({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRPayState();
}

class _QRPayState extends State<QRPay> {
  Barcode result;
  QRViewController qrController;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  double height = 0;
  double width = 0;
  bool isFlash = false;
  int stackIndex = 0;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      qrController.pauseCamera();
    }
    qrController.resumeCamera();
  }

  @override
  void dispose() {
    qrController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(

      body: IndexedStack(
        index: stackIndex,
      children: [
        body,
        detailContainer,
      ],
      ),
    );
  }

  Widget get body=>Stack(
    children: <Widget>[
      _buildQrView(context),

      Positioned(
        top: 20,
        right: 10,
        child: IconButton(
          onPressed: (){
            Navigator.pop(context);
          }, icon: Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white.withOpacity(0.3)),
            child: Icon(Icons.clear_outlined,color: Colors.white,)),),),
      Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: IconButton(onPressed: ()async{

            await qrController.toggleFlash();
            isFlash = (await qrController.getFlashStatus());
            setState(() {});
          }, icon: Icon(isFlash?Icons.flash_off:Icons.flash_auto,color: Colors.white,),)),
    ],
  );

  Widget _buildQrView(BuildContext context) {
    var scanArea = height*0.25;
    // we need to listen for Flutter SizeChanged notification and update qrController
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.purple,
          borderRadius: 10,
          borderLength: 20,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  Widget get detailContainer=>Container(
    color: Colors.white,
    child: ListView(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
        IconButton(onPressed: (){
        // Navigator.pop(context);
          setState(() {
            stackIndex = 0;
          });
      }, icon: Icon(Icons.arrow_back))],),
      Text('testing'),
    ],),
  );


  void _onQRViewCreated(QRViewController ctlr) {
    setState(() {
      qrController = ctlr;
    });
    ctlr.scannedDataStream.listen((scanData)async {
      setState(() {
        result = scanData;
      if (result.code.isNotEmpty) {
        stackIndex = 1;
        // navPush(context: context, action: UserDetailScreen());
      }
      });

      //upi://pay?pa=9198483660@paytm&pn=Manjesh%20Vishwa karma&mc=0000&mode=02&purpose=00&orgid=159761
      //upi://pay?pa=9198483660@upi&pn=manje74546&mc=0000&mode=02&purpose=00&orgid=103&PAY0000009
      // await qrController!.pauseCamera();
      log('Data====>>>   ${result.code}');
      var ss = result.code.split('pay?pa=').toString().trim();
      int ind = result.code.replaceAll('upi://pay?pa=', '').indexOf('&');
      log('Data====>>>   ${result.code.replaceAll('upi://pay?pa=', '').substring(0,ind)}');
    });
  }
  


  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }


}