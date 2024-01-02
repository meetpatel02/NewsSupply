// ignore_for_file: prefer_const_constructors, deprecated_member_use, depend_on_referenced_packages

import 'dart:io';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class PdfInvoiceApi {
  Future<void> generate() async {
    final font = await rootBundle.load("assets/font/Inter-Regular.ttf");
    final boldFont = await rootBundle.load("assets/font/Inter-Bold.ttf");
    final semiBold = await rootBundle.load("assets/font/Inter-SemiBold.ttf");
    var logo = (await rootBundle.load('assets/images/news-logo.png'))
        .buffer
        .asUint8List();
    var qrCode = (await rootBundle.load('assets/images/qr-code.png'))
        .buffer
        .asUint8List();
    final pdf = Document();

    pdf.addPage(MultiPage(
      build: (context) => [
        buildTitle(Font.ttf(font), logo, Font.ttf(boldFont)),
        SizedBox(height: 20),
        invoiceDetails(),
        SizedBox(height: 20),
        buildTable(Font.ttf(font),),
        SizedBox(height: 20),
        buildTotalAndDetails(Font.ttf(semiBold),qrCode),
      ],
      pageFormat: PdfPageFormat.a4.copyWith(
          marginBottom: 25, marginTop: 0, marginLeft: 0, marginRight: 0),
       footer: (context) => buildFooter(Font.ttf(font), Font.ttf(semiBold)),
    ));

    final output = await getTemporaryDirectory();
    final file = File("${output.path}/invoice.pdf");
    await file.writeAsBytes(await pdf.save());

    // Open the PDF file
    OpenFile.open(file.path);
  }

  ///HEADER & LOGO
  static Widget buildTitle(Font font, dynamic image, Font boldFont) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20, width: 20),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: SizedBox(
                height: 150, width: 150, child: Image(pw.MemoryImage(image))),
          ),

          SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
                width: 375,
                height: 40,
                decoration: BoxDecoration(color: PdfColor.fromHex('ffc80a'))),
            Text('INVOICE',
                style: TextStyle(
                    color: PdfColors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
            Container(
                width: 75,
                height: 40,
                decoration: BoxDecoration(color: PdfColor.fromHex('ffc80a'))),
          ]),
          // SizedBox(height: 0.8 * PdfPageFormat.cm),
        ],
      );

    ///Invoice Details
   static Widget invoiceDetails(){
     return Container(
       margin: EdgeInsets.only(left: 55,right: 55),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
           children: [
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text('Invoice To:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                 SizedBox(height: 5),
                 Text('Meet Patel',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,)),
                 Text('C-403,Prachi Apartment\nNr.Fortune Hotel\nthaltej Ahmedabad 380061',style: TextStyle(fontSize: 14)),
               ]
             ),
             Column(
               children: [
                 Row(
                     children: [
                       Text('Invoice#'),
                       SizedBox(width: 25),
                       Text('HS762'),
                     ]
                 ),
                 SizedBox(height: 5),
                 Row(
                     children: [
                       Text('Date'),
                       SizedBox(width: 25),
                       Text('02/01/2024'),
                     ]
                 )
               ]
             )
           ],
         )
           ]
       )
     );
   }

  ///Bill Table
  static Widget buildTable(Font font) {
    final headers = ['Sr.','Details', 'Price',];
    final List<Map<String, dynamic>> newspapers = [
      {'index':'1','name': 'Paper', 'price': 10.0,},
      {'index':'2','name': 'Loksatta', 'price': 15.0},
      {'index':'3','name': 'Sandesh', 'price': 12.0,},
      {'index':'4','name': 'Gujarat Samachar','price': '18.0'},
      {'index':'5','name': 'Divya Bhaskar', 'price': 16.0,},
      {'index':'6','name': 'Times of India', 'price': 20.0,},
      {'index':'7','name': 'Magazine', 'price': 25.0,},
      {'index':'8','name': 'Indian Express', 'price': 22.0,},
      {'index':'9','name': 'Mahino', 'price': 30.0,},
    ];

    final tableData = newspapers
        .map((newspaper) => [newspaper['index'],newspaper['name'],'₹${newspaper['price']}',])
        .toList();
    return Container(
        margin: EdgeInsets.only(left: 55, right: 55),
        child: Table.fromTextArray(
          cellStyle: TextStyle(font: font, fontSize: 8),
          headers: headers,
          data: tableData,
          border: TableBorder.all(color: PdfColors.black),
          cellDecoration: (index, data, rowNum) {
            return BoxDecoration(
              color: rowNum.isEven?PdfColor.fromHex('#F2F2F2'):PdfColors.white,
            );
          },
          headerStyle: TextStyle(
              fontWeight: FontWeight.bold,
              font: font,
              color: PdfColors.white,
              fontSize: 8),
          headerDecoration: BoxDecoration(
              color: PdfColor.fromHex('#373B46'),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(2), topRight: Radius.circular(2))),
          cellHeight: 30,
          cellAlignments: {
            0: Alignment.centerLeft,
            1: Alignment.centerLeft,
            2: Alignment.center,

          },
        ));
  }
   static Widget buildTotalAndDetails(Font bold,dynamic image){
     return Column(
       children: [
         Container(
             margin: EdgeInsets.only(left: 55,),
             child:  Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text('Thank you for your business'),
                   Container(
                       width: 200,
                       height: 40,
                       decoration: BoxDecoration(
                           color: PdfColor.fromHex('ffc80a')
                       ),
                       child: Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Text('Total:',style: TextStyle(fontSize: 18,font: bold)),
                             SizedBox(width: 10),
                             Text('220.0',style: TextStyle(fontSize: 18,font: bold)),
                           ]
                       )
                   )
                 ]
             ),
         ),
         Container(
           margin: EdgeInsets.only(left: 55,),
           child: Row(
               children: [
                 Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text('Payment Info:',style: TextStyle(fontWeight: FontWeight.bold)),
                       SizedBox(height: 5),
                       Row(
                           children: [
                             Text('Account #',style: TextStyle(fontSize: 12)),
                             SizedBox(width: 35),
                             Text('123 4567 8900',style: TextStyle(fontSize: 12)),
                           ]
                       ),
                       Row(
                           children: [
                             Text('A/C Name',style: TextStyle(fontSize: 12)),
                             SizedBox(width: 35),
                             Text('Hasti Roli Bank',style: TextStyle(fontSize: 12)),
                           ]
                       )
                     ]
                 ),
                 SizedBox(width: 60),
                 SizedBox(
                     height: 85, width: 85, child: Image(pw.MemoryImage(image))),
               ]
           ),
         ),
       ]
     );
   }

  ///Additional Notes
  static Widget buildFooter(Font font, Font boldFont) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 2 * PdfPageFormat.mm),
        Row(
          children: [
            Container(
                width: 380,
                height: 5,
                decoration: BoxDecoration(
                  color: PdfColor.fromHex('ffc80a'),
                )
            ),
            SizedBox(width: 10),
            Column(
              children: [

                Text('Authorised Sign'),
              ]
            ),
            SizedBox(width: 10),
            Container(
                width: 120,
                height: 5,
                decoration: BoxDecoration(
                  color: PdfColor.fromHex('ffc80a'),
                )
            ),
          ]
        ),
          SizedBox(height: 25),
          Container(
            margin: EdgeInsets.only(left: 55),
            child: Text('+91 9898141248 | Vadodara,Gujarat | www.hiteshnewssupply.com')
          )
        ],
      );

  static buildText(
      {required String title,
      String? value,
      double width = double.infinity,
      TextStyle? titleStyle,
      bool unite = false,
      Font? font,
      required String currencySymbol}) {
    final style = titleStyle ??
        TextStyle(fontWeight: FontWeight.bold, font: font, fontSize: 10);

    return Container(
      width: width,
      child: Row(
        children: [
          Expanded(child: Text(title, style: style)),
          Text('$currencySymbol$value'.toString(), style: style)
        ],
      ),
    );
  }
}


