import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:ttech_attendance/core/helpers/constants.dart';
import 'package:ttech_attendance/featchers/performance_panel/data/models/performance_employee_response.dart';
import 'package:ttech_attendance/generated/l10n.dart';

class PrintTransactions {
  static Future<void> exportAndPrintListViewItems(
      List<String> items, String pdfName) async {
    // Convert the ListView items to a PDF document
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.ListView(
            children: items.map((item) => pw.Text(item)).toList(),
          );
        },
      ),
    );

    // Save the PDF document to a file
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$pdfName.pdf');
    await file.writeAsBytes(await pdf.save());

    // Print the PDF document
    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }

  static Future<void> printEmployeeAttendanceList(
      List<Day> days, String pdfName, BuildContext buildContext) async {
    final pdf = pw.Document();
    final fontData = await rootBundle.load('fonts/Amiri-Regular.ttf');
    final ttf = pw.Font.ttf(fontData);

    pw.TextStyle pdfFontStyle = pw.TextStyle(
        fontSize: 24,
        fontWeight: pw.FontWeight.bold,
        font: Intl.defaultLocale == MyConstants.arabic ? ttf : null);
    const int itemsPerPage = 10; // Adjust this value as needed
    final int pageCount = (days.length / itemsPerPage).ceil();

    for (int page = 0; page < pageCount; page++) {
      final List<Day> pageEmployees =
          days.skip(page * itemsPerPage).take(itemsPerPage).toList();

      pdf.addPage(
        pw.Page(
          margin: const pw.EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          textDirection: Intl.defaultLocale == MyConstants.arabic
              ? pw.TextDirection.rtl
              : pw.TextDirection.ltr,
          build: (pw.Context context) {
            return pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.center,
              children: [
                pw.Text(S.of(buildContext).attendanceReports,
                    style: pdfFontStyle),
                pw.SizedBox(height: 20),
                pw.Directionality(
                    textDirection: Intl.defaultLocale == MyConstants.arabic
                        ? pw.TextDirection.rtl
                        : pw.TextDirection.ltr,
                    child: pw.Table(
                      border: pw.TableBorder.all(),
                      children: [
                        pw.TableRow(
                          children: [
                            pw.Padding(
                                padding: const pw.EdgeInsets.all(4),
                                child: pw.Directionality(
                                  textDirection:
                                      Intl.defaultLocale == MyConstants.arabic
                                          ? pw.TextDirection.rtl
                                          : pw.TextDirection.ltr,
                                  child: pw.Text(S.of(buildContext).workHours,
                                      style: pdfFontStyle),
                                )),
                            pw.Padding(
                                padding: const pw.EdgeInsets.all(4),
                                child: pw.Directionality(
                                  textDirection:
                                      Intl.defaultLocale == MyConstants.arabic
                                          ? pw.TextDirection.rtl
                                          : pw.TextDirection.ltr,
                                  child: pw.Text(S.of(buildContext).leaveTime,
                                      style: pdfFontStyle),
                                )),
                            pw.Padding(
                                padding: const pw.EdgeInsets.all(4),
                                child: pw.Directionality(
                                  textDirection:
                                      Intl.defaultLocale == MyConstants.arabic
                                          ? pw.TextDirection.rtl
                                          : pw.TextDirection.ltr,
                                  child: pw.Text(
                                      S.of(buildContext).attendanceTime,
                                      style: pdfFontStyle),
                                )),
                            pw.Padding(
                                padding: const pw.EdgeInsets.all(4),
                                child: pw.Directionality(
                                  textDirection:
                                      Intl.defaultLocale == MyConstants.arabic
                                          ? pw.TextDirection.rtl
                                          : pw.TextDirection.ltr,
                                  child: pw.Text(S.of(buildContext).day,
                                      style: pdfFontStyle),
                                )),
                          ],
                        ),
                        ...pageEmployees.map(
                          (e) => pw.TableRow(
                            children: [
                              pw.Expanded(
                                  child: pw.Padding(
                                padding: const pw.EdgeInsets.symmetric(
                                    horizontal: 7, vertical: 3),
                                child: pw.Directionality(
                                  textDirection:
                                      Intl.defaultLocale == MyConstants.arabic
                                          ? pw.TextDirection.rtl
                                          : pw.TextDirection.ltr,
                                  child: pw.Text(
                                    style: pdfFontStyle,
                                    e.workingTime!,
                                  ),
                                ),
                              )),
                              pw.Padding(
                                padding: const pw.EdgeInsets.symmetric(
                                    horizontal: 7, vertical: 3),
                                child: pw.Directionality(
                                  textDirection:
                                      Intl.defaultLocale == MyConstants.arabic
                                          ? pw.TextDirection.rtl
                                          : pw.TextDirection.ltr,
                                  child: pw.Text(
                                    style: pdfFontStyle,
                                    e.shift1TimeOut ?? "",
                                  ),
                                ),
                              ),
                              pw.Padding(
                                padding: const pw.EdgeInsets.symmetric(
                                    horizontal: 7, vertical: 3),
                                child: pw.Directionality(
                                  textDirection:
                                      Intl.defaultLocale == MyConstants.arabic
                                          ? pw.TextDirection.rtl
                                          : pw.TextDirection.ltr,
                                  child: pw.Text(
                                    style: pdfFontStyle,
                                    e.shift1TimeIn ?? "",
                                  ),
                                ),
                              ),
                              pw.Padding(
                                padding: const pw.EdgeInsets.symmetric(
                                    horizontal: 7, vertical: 3),
                                child: pw.Text(
                                  style: pdfFontStyle,
                                  "${Intl.defaultLocale == MyConstants.arabic ? e.dayAr : e.dayEn!}  ${e.date!.day}-${e.date!.month}",
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )),
              ],
            );
          },
        ),
      );
    }
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$pdfName.pdf');
    await file.writeAsBytes(await pdf.save());
    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }
}
