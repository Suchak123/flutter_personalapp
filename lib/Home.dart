import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:personalapp/repository/sample_repo.dart';
import 'model/sample_model.dart';


class Home extends StatefulWidget {

  Home({super.key});

  List<Superheros>? superheros;

  @override
  State<Home> createState() => _HomeState();

}

class _HomeState extends State<Home> {
  List<Superheros>? superheros;

  @override
  void initState() {
    getApiData();
    super.initState();
  }

  void getApiData() async {
    final sampleRepo = SampleRepo();
    sampleRepo.sampleApiCall();
    final superHerosList = await sampleRepo.sampleApiCall();
    // print(superHerosList);
    setState(() {
      superheros = superHerosList;
    });
  }


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: superheros!=null ? superheros!.length : 0,
        itemBuilder: (context, index){

      return ListTile(
        title: Text(superheros!=null ? superheros![index].name! : 'Name'),
        subtitle: Text(superheros!=null ? superheros![index].power! : 'Power'),
        leading: Image.network(superheros![index].url!),
      );
    });
  }
}
