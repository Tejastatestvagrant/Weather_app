
import 'package:flutter/material.dart';




     Future getCurrentWeather(){
          return Future(() => null);
     }
class HomePage extends StatelessWidget {
  const HomePage({super.key});

   



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:const Text("Weather App",
        style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        
        // if you need to add any icon use action property
        actions:  [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              // ignore: avoid_print
              onTap: () { print("refresh");
              },
              child: const Icon(Icons.refresh ,textDirection: TextDirection.rtl,
              size: 25,
              )
            
              ),
          )
        ],
          ),
      body:  Padding(
        padding: const  EdgeInsets.all(16.0),
        child:   Column(
          children: [
            //main card
           SizedBox(
            width: double.infinity,
             child:   Card(
              elevation: 3,
             shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
             ),
              child:const  Column(
                children: [
                   SizedBox(height: 10,),
                  Text("330°F",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  SizedBox(height: 10,),
                  Icon(Icons.cloud ,size: 89,),
                  SizedBox(height: 10,),
                  Text("Rain" ,
                  style: TextStyle(
                    fontSize: 23,
                  ),),
                  SizedBox(height: 15,),

                ],
              ),
             
             ),
           ),
             const  SizedBox(height: 20),
             Container(
              alignment: Alignment.centerLeft,
               child: const Text("Weather Forecast", 
               style: TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: 20,
                 
               ),
               ),
             ),
              const  SizedBox(height: 10),
            //forcast card
            const  SingleChildScrollView(
              scrollDirection: Axis.horizontal,
               child:  Row(
                children: [
                  HourlyForecastItem(timevalue: '09:00', icon: Icons.cloud, value: "332",),
                 HourlyForecastItem(timevalue: '09:00', icon: Icons.cloud, value: "332",),
                HourlyForecastItem(timevalue: '09:00', icon: Icons.cloud, value: "332",),
                HourlyForecastItem(timevalue: '09:00', icon: Icons.cloud, value: "332",),
                 HourlyForecastItem(timevalue: '09:00', icon: Icons.cloud, value: "332",),
                ]
               ),
             ),
            const  SizedBox(height: 20),
             Container(
              alignment: Alignment.centerLeft,
               child: const Text("Additional Information ", 
               style: TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: 20,
                 
               ),
               ),
             ),

              const  SizedBox(height: 10),
              
           const  Row(
         
            children: [
                          AdditionalInfoItem(icon: Icons.water_drop, lable: "Humididty", value: "90"),
                          AdditionalInfoItem(icon: Icons.air, lable: "wind Speed", value: "90"),
                          AdditionalInfoItem(icon: Icons.beach_access, lable: "pressure", value: "1000"),

                      ]
    
                    ),
        ],
        )
      )
    );
                
      
   
  }

  
}

   

  class HourlyForecastItem extends StatelessWidget {

    final String timevalue;
    final IconData icon;
    final String value;

  const HourlyForecastItem({super.key, required this.timevalue, required this.icon, required this.value});

  @override
  Widget build(BuildContext context) {
    return   Card(
                    elevation: 3,
                    child:  SizedBox(
                      width: 120,
                 
                      child:  Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                              Text(timevalue, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                              const SizedBox(height: 8,),
                              Icon(icon, size: 38,),
                               const SizedBox(height: 8,),
                              Text(value ,style: const TextStyle(fontSize: 19),)
                          ],
                        ),
                      ),
                    ) ,
                  );
  }
}

class AdditionalInfoItem extends StatelessWidget {

  final IconData icon;
  final String lable;
  final String value;
  const AdditionalInfoItem({super.key, required this.icon, required this.lable, required this.value});
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:const   EdgeInsets.all(5.0),
      child:   Card(
                  elevation: 0,
                  child: SizedBox(
                    width: 100,
                    child: Column(
                      children: [
                       const   SizedBox(
                          height: 9,
                        ),
                        Icon(icon,
                        size: 31,),
                      const    SizedBox(
                          height: 9,
                        ),
                        Text(lable),
                       const  SizedBox(
                          height: 9,
                        ),
                        Text(value,
                         style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                        ),)
                        
                      ],
                    
                    ),
                  ),
                ),
    );

  }
}