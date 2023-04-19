import 'package:bmi/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var height;
  var weight;
  double result = 0;
  TextEditingController heightcontroller = TextEditingController();
  TextEditingController weightcontroller = TextEditingController();
  calBMI() {
    height = double.parse(heightcontroller.text);
    weight = double.parse(weightcontroller.text);
    setState(() {
      result = weight / (height * height);
      result.roundToDouble();
    });
    Handleheight(value) {
      setState(() {
        height = double.parse(value);
      });
    }

    Handleweight(value) {
      setState(() {
        weight = double.parse(value);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("bmi calculator"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Text("bmi calculator"),
              TextField(
                controller: heightcontroller,
                keyboardType: TextInputType.number,
                onChanged: (value) => weight.Handleheight,
                decoration: const InputDecoration(
                  hintText: "enter your height in meters",
                ),
              ),
              TextField(
                controller: weightcontroller,
                keyboardType: TextInputType.number,
                onChanged: (value) => weight.Handleweight,
                decoration: const InputDecoration(
                  hintText: "enter your weight in meters",
                ),
              ),
              ElevatedButton(
                onPressed: calBMI,
                child: Text("calculate"),
              ),
              Text(
                "result:$result",
                textScaleFactor: 2,
              )
            ],
          ),
        ),
      ),
    );
  }
}
