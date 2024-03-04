
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:weather_app/additional_info-item.dart';
import 'package:weather_app/hourly_forecast_item.dart';
import 'package:weather_app/secrets.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String temp = '0';
  bool isLoading=true;
  Future<Map<String ,dynamic>> getCurrentWeather() async {
    try {

      String cityname = "bangalore";

      final Response res = await http.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$cityname&APPID=$apikey'));
      if (res.statusCode != 200) {
        throw 'An Error Occured ';
      }
       return jsonDecode(res.body);

    } catch (e) {
     
      throw e.toString();
    }
  }

  @override
  void initState() {
    super.initState();
    try {
  getCurrentWeather();
} on Exception catch (e) {
  debugPrint(e.toString());

}

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Weather App",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          // if you need to add any icon use action property
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  // ignore: avoid_print
                  onPressed: () {
                    setState((){
                       getCurrentWeather();
                    });
                    
                  },
                   icon: const  Icon(
                    Icons.refresh,
                    size: 25,
                  )),
            )
          ],
        ),

        /// here futureBuilder is to handle the async opertion that api call is returnung data
        /// so we can call the future in future propterty 
        /// in snapshot is that returned data is store 
        ///   shapshot as a status that can be helpfull to handle the status
        body:  FutureBuilder(
          future:getCurrentWeather() ,
          builder: (context ,snapshot) {
            // print(snapshot);
            //  print(snapshot.runtimeType);
            if(snapshot.connectionState==ConnectionState.waiting){

              // here adaptive means it changes according to os 
              return const Center(child:  CircularProgressIndicator.adaptive());
            }
            if(snapshot.hasError){
              return Center(child: Text(snapshot.error.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
                fontSize: 19,

              ),));

            
          }
          
          
                final data = snapshot.data!;
                final cur = data['list'][0];
              final  curtemp=cur['main']['temp'].toString();
              final curhumidity=cur['main']['temp'].toString();
               final curpressure=cur['main']['pressure'].toString();
               final curwindspeed= cur['wind']['speed'].toString();
               final cursky = cur['weather'][0]["main"].toString();
          
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  //main card
                  SizedBox(
                    width: double.infinity,
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child:  Column(
                        children: [
                         const  SizedBox(
                            height: 10,
                          ),
                          Text(
                            '$curtemp °F',
                            style: const TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold),
                          ),
                         const  SizedBox(
                            height: 10,
                          ),
                           Icon(
                          cursky =='Clouds' || cursky=='Rain'? Icons.cloud : Icons.sunny ,
                            size: 89,
                          ),
                        const   SizedBox(
                            height: 10,
                          ),
                            Text(
                            cursky,
                            style: const TextStyle(
                              fontSize: 23,
                            ),
                          ),
                         const  SizedBox(
                           height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Weather Forecast",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  //forcast card
                  // instead of the singlechild view for loading all at onces 
                  //  SingleChildScrollView(
                  //   scrollDirection: Axis.horizontal,
                  //   child: Row(children: [

                  //     for(int i=0;i<=5;i++)
                  //     HourlyForecastItem(
                  //       timevalue: data['list'][i]['dt'].toString(),
                  //       icon: data['list'][i]['weather'][0]['main']=='Clouds' || data['list'][i]['weather'][0]['main']=='Rain' ? Icons.cloud :Icons.sunny,
                  //       value:data['list'][i]['main']['temp'].toString() ,
                  //     ),
                      
                  //   ]),
                  // ),





                  //use listViewBuilder of lazy building means when u scroll it will load the time for a what u need
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                       itemCount: 5,
                       itemBuilder: (context,index){
                        final time = DateTime.parse(data['list'][index]['dt_txt']);
  
    
                       return HourlyForecastItem(
                         timevalue: DateFormat.j().format(time),
                         icon: data['list'][index]['weather'][0]['main']=='Clouds' || data['list'][index]['weather'][0]['main']=='Rain' ? Icons.cloud :Icons.sunny,
                    
                         value:data['list'][index]['main']['temp'].toString() ,
                       );
                    
                       }
                    
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Additional Information ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
          
                  const SizedBox(height: 10),
          
                   Row(children: [
                    AdditionalInfoItem(
                        icon: Icons.water_drop, lable: "Humididty", value: curhumidity),
                    AdditionalInfoItem(
                        icon: Icons.air, lable: "wind Speed", value: curwindspeed),
                    AdditionalInfoItem(
                        icon: Icons.beach_access,
                        lable: "pressure",
                        value: curpressure),
                  ]),
                ],
              ));
          },
        ));
  }
}


