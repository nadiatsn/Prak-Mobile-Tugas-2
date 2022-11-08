import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'countries_model.dart';
import 'covid_data_source.dart';

class ListCountries extends StatefulWidget {
  const ListCountries({Key? key}) : super(key: key);
  @override
  _ListCountriesState createState() => _ListCountriesState();
}
class _ListCountriesState extends State<ListCountries> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Center(child : Text("List Countries", textAlign: TextAlign.center,
            style: TextStyle(fontStyle: FontStyle.italic, fontFamily:'LilitaOne',
                fontWeight: FontWeight.normal, fontSize: 35)),),
      ),
      body: _buildListCountriesBody(),
    );
  }
  Widget _buildListCountriesBody() {
    return Container(
      child: FutureBuilder(
        future: CovidDataSource.instance.loadCountries(),
        builder: (
            BuildContext context,
            AsyncSnapshot<dynamic> snapshot,
            ) {
          if (snapshot.hasError) {
            return _buildErrorSection();
          }
          if (snapshot.hasData) {
            CountriesModel countriesModel =
            CountriesModel.fromJson(snapshot.data);
            return _buildSuccessSection(countriesModel);
          }
          return _buildLoadingSection();
        },
      ),
    );
  }
  Widget _buildErrorSection() {
    return Text("Error");
  }
  Widget _buildEmptySection() {
    return Text("Empty");
  }
  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
  Widget _buildSuccessSection(CountriesModel data) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7),
      itemCount: data.countries?.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.yellow[600],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
          ),
          child: Center(
            child : Padding(
                padding: const EdgeInsets.all(10.0),
                child: _buildItemCountries("${data.countries?[index].name} \n (${data.countries?[index].iso3})")
            ),
          ),
        );
      }, // return _buildItemCountries("${data.countries?[index].name} \n ${data.countries?[index].iso3}");
    );
  }
  Widget _buildItemCountries(String value) {
    return Text(value, textAlign: TextAlign.center, style: TextStyle(fontFamily:'LilitaOne', fontWeight: FontWeight.normal));
  }
}