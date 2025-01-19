import 'dart:io';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../models/food.dart';

class PDFService {
  Future<void> generatePDF(List<Food> foodLogs) async {
    final pdf = pw.Document();

    pdf.addPage(pw.Page(
      build: (context) => pw.Column(
        children: foodLogs.map((food) => pw.Text('${food.name}: ${food.calories} kcal')).toList(),
      ),
    ));

    await Printing.sharePdf(bytes: await pdf.save(), filename: 'weekly_report.pdf');
  }
}
