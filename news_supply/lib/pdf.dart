// ignore_for_file: prefer_const_constructors, deprecated_member_use, depend_on_referenced_packages

import 'dart:io';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
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
    var logo =
    (await rootBundle.load('assets/images/SI.png')).buffer.asUint8List();
    final pdf = Document();

    pdf.addPage(MultiPage(
      build: (context) => [
        buildTitle(Font.ttf(font), logo, Font.ttf(boldFont)),
        SizedBox(height: 20),
        buildTermsAndCondition(Font.ttf(semiBold)),
      ],
      pageFormat: PdfPageFormat.a4,
      footer: (context) => buildFooter(Font.ttf(font), Font.ttf(semiBold)),
    ));

    final output = await getTemporaryDirectory();
    final file = File("${output.path}/invoice.pdf");
    await file.writeAsBytes(await pdf.save());

    // Open the PDF file
    OpenFile.open(file.path);
  }

  ///HEADER & LOGO
  static Widget buildTitle(
       Font font, dynamic image, Font boldFont) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hitesh News Paper Supply',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                font: boldFont,
                color: PdfColor.fromHex('142969')),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(
              child: Column(children: [
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Text(
                        'Invoice Date',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            font: font),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Text(
                        '31-12-2023',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            font: boldFont),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Text(
                        'Name',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            font: font),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Text(
                        'Patel Meet R',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            font: boldFont),
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Text(
                        'Due Date',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            font: font),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Text(
                        'INVOICE 2',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            font: boldFont),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
            Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: PdfColor.fromHex('F5F5F5'),
                    borderRadius: BorderRadius.circular(10)),
                child: SizedBox(
                    height: 130,
                    width: 130,
                    child: Image(pw.MemoryImage(image))))
          ]),
          SizedBox(height: 0.8 * PdfPageFormat.cm),
        ],
      );

  ///BILLED To & By Container
  static Widget buildContainer(
       Font font, Font boldFont, Font semiFont) =>
      Row(children: [
        ///Billed By Container
        Flexible(
          flex: 4,
          child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: PdfColor.fromHex('F5F5F5'),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'BILLED BY',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          font: boldFont,
                          color: PdfColor.fromHex('142969')),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '1',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          font: semiFont,
                          color: PdfColors.black),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '1',
                      maxLines: 5,
                      style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                          font: font,
                          color: PdfColors.black,
                      ),

                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'GSTIN',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                font: semiFont,
                                color: PdfColors.black),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            '2',
                            style: TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.bold,
                                font: font,
                                color: PdfColors.black),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'PAN',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                font: semiFont,
                                color: PdfColors.black),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            '3',
                            style: TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.bold,
                                font: font,
                                color: PdfColors.black),
                          ),
                        ),
                      ],
                    ),
                  ])),
        ),
        SizedBox(width: 10),

        ///Billed To Container
        Flexible(
          flex: 4,
          child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: PdfColor.fromHex('F5F5F5'),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'BILLED TO',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          font: boldFont,
                          color: PdfColor.fromHex('142969')),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '4',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          font: semiFont,
                          color: PdfColors.black),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '5',
                      maxLines: 5,
                      style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                          font: font,
                          color: PdfColors.black),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'GSTIN',
                            style: TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.bold,
                                font: semiFont,
                                color: PdfColors.black),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            '6',
                            style: TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.bold,
                                font: font,
                                color: PdfColors.black),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'PAN',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                font: semiFont,
                                color: PdfColors.black),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            '7',
                            style: TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.bold,
                                font: font,
                                color: PdfColors.black),
                          ),
                        ),
                      ],
                    ),
                  ])),
        )
      ]);



  ///Bank Details,Qr Code and Total
  static Widget buildTotal(Font font) {
    return Container(
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 4,
            child:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Bank Account Details',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      font: font,
                      fontSize: 12,
                      color: PdfColor.fromHex('142969'))),
              SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Text(
                      'Account Holder Name',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        font: font,
                        color: PdfColor.fromHex('8F99B1'),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 4,
                      child: Text(
                        '1',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            font: font,
                            color: PdfColors.black),
                      ))
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Text(
                      'Account Number',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        font: font,
                        color: PdfColor.fromHex('8F99B1'),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 4,
                      child: Text(
                        '2',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            font: font,
                            color: PdfColors.black),
                      ))
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Text(
                      'IFSC',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        font: font,
                        color: PdfColor.fromHex('8F99B1'),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 4,
                      child: Text(
                        '3',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            font: font,
                            color: PdfColors.black),
                      ))
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Text(
                      'Account Type',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        font: font,
                        color: PdfColor.fromHex('8F99B1'),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 4,
                      child: Text(
                        '4',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            font: font,
                            color: PdfColors.black),
                      ))
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Text(
                      'Bank',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        font: font,
                        color: PdfColor.fromHex('8F99B1'),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 4,
                      child: Text(
                        '5',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            font: font,
                            color: PdfColors.black),
                      ))
                ],
              ),
            ]),
          ),
          // Column(children: [
          //   Text('UPI - Scan to Pay',
          //       style: TextStyle(color: PdfColors.grey, fontSize: 8)),
          //   SizedBox(height: 5),
          //   Container(
          //     height: 70,
          //     width: 70,
          //     child: BarcodeWidget(
          //       barcode: Barcode.qrCode(),
          //       data: invoice.bankName.toString(),
          //     ),
          //   ),
          // ]),

        ],
      ),
    );
  }

  ///Terms and Condition
  static Widget buildTermsAndCondition(Font font) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('Terms and Conditions',
            style: TextStyle(
              color: PdfColor.fromHex('142969'),
              font: font,
              fontSize: 12,
            )),
        SizedBox(height: 5),
        Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('1. '),
              Text(
                  'Please pay within 15 days from the date of invoice ,overdue intrest @ 14%\nwill be charged on delayed payment',
                  style: TextStyle(fontSize: 10))
            ]),
        SizedBox(height: 5),
        Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('2. '),
              Text('Please quote invoice number when remitting funds.',
                  style: TextStyle(fontSize: 10))
            ]),
      ]);

  ///Additional Notes
  static Widget buildFooter(Font font, Font boldFont) => Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(height: 2 * PdfPageFormat.mm),
      Divider(),
      RichText(
          text: TextSpan(children: [
            TextSpan(
                text: 'For any enquiries,email us on ',
                style: TextStyle(color: PdfColors.grey, fontSize: 10)),
            TextSpan(
                text: 'spectusinfotech@gmail.com',
                style: TextStyle(fontSize: 11, font: boldFont,color: PdfColor.fromHex('142969'))),
            TextSpan(
                text: ' or call us on ',
                style: TextStyle(color: PdfColors.grey, fontSize: 10)),
            TextSpan(
                text: '+91 1234567890',
                style: TextStyle(fontSize: 11, font: boldFont,color: PdfColor.fromHex('142969')))
          ])),
    ],
  );

  static buildText(
      {required String title,
        String? value,
        double width = double.infinity,
        TextStyle? titleStyle,
        bool unite = false,
        Font? font,
        required String currencySymbol
      }) {
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