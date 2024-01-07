import 'package:flutter/material.dart';
import 'package:flutter_firebase/view_models/countries_viewmodel.dart';
import 'package:provider/provider.dart';

class CountriesPage extends StatelessWidget {
  const CountriesPage({super.key});
  

  @override
  Widget build(BuildContext context) {
  final countryNameController=TextEditingController();
  final capitalNameController=TextEditingController();
  

  WidgetsBinding.instance.addPostFrameCallback((_) {
    CountriesViewModel viewModel = Provider.of(
                  context,
                  listen: false,);
      viewModel.getCountries();
    });
    return  Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Consumer<CountriesViewModel>(
              builder: (context, viewModel, child) => ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: viewModel.countries.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(viewModel.countries[index].name),
                    subtitle: Text(viewModel.countries[index].capital ?? "no capital"),
                  );
                },
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: FloatingActionButton(onPressed: (){
                  
                  //CountriesViewModel viewModel=Provider.of(context,listen: false);
                  
                  addCountryPopUp(context, countryNameController, capitalNameController);
                  
                },child: const Icon(Icons.add),)))
          ],
        ),
      ),
    );
  }



  Future addCountryPopUp(BuildContext parentContext,TextEditingController countryNameController,TextEditingController capitalNameController)
  {
    return showDialog(
        context: parentContext,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(20.0)),
            child: SizedBox(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    TextField(
                      controller: countryNameController,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'country name'),
                    ),
                    TextField(
                      controller: capitalNameController,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: '(optional) capital name'),
                    ),
                    TextButton(
                      onPressed: () {
                        CountriesViewModel viewModel = Provider.of<CountriesViewModel>(
                          parentContext,
                          listen: false,
                        );
                        viewModel.addCountry(context,countryNameController.text,capitalNameController.text);
                        Navigator.of(context, rootNavigator: true).pop();
                      },
                      child: const Text(
                        "add",
                        style: TextStyle(color: Colors.white),
                      ),
                      
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

}