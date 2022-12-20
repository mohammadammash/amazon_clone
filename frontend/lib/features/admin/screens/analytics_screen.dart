import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/admin/models/sales.dart';
import 'package:amazon_clone/features/admin/services/analytics_services.dart';
import 'package:amazon_clone/features/common/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  AnalyticsServices analyticsServices = AnalyticsServices();
  String? totalEarnings;
  List<Sales>? earnings;

  void fetchAnalytics() async {
    final data =
        await analyticsServices.fetchCategoriesAnalytics(context: context);
    totalEarnings = data['totalEarnings'].toString();
    earnings = data['sales'];
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchAnalytics();
  }

  @override
  Widget build(BuildContext context) {
    return earnings == null || totalEarnings == null
        ? const CustomLoadingIndicator()
        : Column(children: [
            Text(
              'Total Sales: \$$totalEarnings',
              style: const TextStyle(
                  fontSize: GlobalVariables.textLG,
                  fontWeight: FontWeight.bold),
            )
          ]);
  }
}
