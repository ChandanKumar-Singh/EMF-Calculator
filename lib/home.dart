import 'package:emf_calculator/models/magnitudeProder.dart';
import 'package:emf_calculator/pages/visualize.dart';
import 'package:emf_calculator/utils/colors.dart';
import 'package:emf_calculator/widgets/mainReading.dart';
import 'package:emf_calculator/widgets/meterReading.dart';
import 'package:emf_calculator/widgets/xyzReading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const MainReading(),
              const XYZReading(),
              const MeterReading(),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                        side: BorderSide(color: Colors.white),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(AppColors.primaryColor),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Visualize()));
                  },
                  child: const Text('Visualize'),
                ),
              ),
              const SizedBox(height: 10),
              Consumer<MagnitudeProvider>(builder: (context, model, child) {
                return SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                          side: BorderSide(color: Colors.white),
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.primaryColor),
                    ),
                    onPressed: () {
                      model.changeValues();
                    },
                    child: Text('Start'),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
