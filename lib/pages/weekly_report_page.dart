import 'package:flutter/material.dart';
import '../services/pdf_service.dart';
import '../models/food.dart';

class WeeklyReportPage extends StatelessWidget {
  final _pdfService = PDFService();
  final List<Food> foodLogs;

  WeeklyReportPage({required this.foodLogs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weekly Report')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _pdfService.generatePDF(foodLogs),
          child: Text('Download Weekly Report'),
        ),
      ),
    );
  }
}
