import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

   data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
   String bgImage = data["isDaytime"] ? 'day.png' : 'night.png';
   Color bgColor = data["isDaytime"] ?  Colors.blue :  Colors.indigo;

    return Scaffold(
      backgroundColor: bgColor,
      body:SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/$bgImage"),
              fit :BoxFit.cover
            )
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(0,120,0,0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                    onPressed:() async{
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        "location": result["location"],
                        "flag": result["flag"] ,
                        "isDaytime":result["isDaytime"],
                        "time":result["time"],
                      };
                    });
                    },
                    icon: Icon(Icons.edit_location,
                    color: Colors.grey[300],),
                    label: Text(
                        "Edit Location",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey[300]
                        ),
                    )
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(data["location"],
                    style: TextStyle(
                      fontSize: 30.0,
                      letterSpacing: 2.0,
                      color: Colors.white
                    ),),
                  ],
                ),
                SizedBox(height: 20.0,),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 66.0,
                      color: Colors.white
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
