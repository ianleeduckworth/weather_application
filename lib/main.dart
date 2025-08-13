import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_application/utilities/fetch_daily.dart';
import 'package:weather_application/utilities/fetch_hourly.dart';
import 'package:weather_application/utilities/get_hour_index.dart';
import 'package:weather_application/utilities/weather_view.dart';
import 'package:weather_application/views/daily_view.dart';
import 'package:weather_application/views/hourly_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Report',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Weather Report'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<FetchHourlyResponse> hourlyWeather;
  late Future<FetchHourlyResponse> tomorrowHourlyWeather;
  late Future<FetchDailyResponse> dailyWeather;
  late int hourIndex;
  late String formattedCurrentDate;

  bool _isRefreshing = false;

  final Set<WeatherView> _selectedView = {WeatherView.hourly};

  Future<void> _refreshData() async {
    print('Refetching data');
    setState(() {
      _isRefreshing = true;
    });

    try {
      await Future.wait([
        hourlyWeather = fetchHourly(false),
        tomorrowHourlyWeather = fetchHourly(true),
        dailyWeather = fetchDaily(),
      ]);
    } catch (e) {
      print('Error refreshing data: $e');
    }

    hourIndex = getHourIndex();

    final now = DateTime.now();
    formattedCurrentDate = DateFormat('yyyy-MM-dd').format(now);

    setState(() {
      _isRefreshing = false;
    });
    print('done refetching data');
  }

  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: _refreshData),
        ],
      ),
      body: _isRefreshing
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                // The toggle switch at the top
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: SegmentedButton<WeatherView>(
                      segments: [
                        ButtonSegment<WeatherView>(
                          value: WeatherView.hourly,
                          label: Text('Hourly'),
                        ),
                        ButtonSegment<WeatherView>(
                          value: WeatherView.tomorrow,
                          label: Text('Tomorrow'),
                        ),
                        ButtonSegment<WeatherView>(
                          value: WeatherView.daily,
                          label: Text('Daily'),
                        ),
                      ],
                      selected: _selectedView,
                      onSelectionChanged: (Set<WeatherView> newSelection) {
                        setState(() {
                          _selectedView.clear();
                          _selectedView.addAll(newSelection);
                        });
                      },
                    ),
                  ),
                ),

                Expanded(
                  child: _selectedView.contains(WeatherView.hourly)
                      ? hourly(context, hourlyWeather, hourIndex)
                      : _selectedView.contains(WeatherView.tomorrow)
                      ? hourly(context, tomorrowHourlyWeather, -1)
                      : daily(context, dailyWeather, formattedCurrentDate),
                ),
              ],
            ),
    );
  }
}
