import 'package:choison_shaju/constant/colorconstant.dart';
import 'package:choison_shaju/news/newscontroller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Newspage extends StatefulWidget {
  const Newspage({super.key});

  @override
  State<Newspage> createState() => _NewspageState();
}

class _NewspageState extends State<Newspage> {
  @override
  void initState() {
    super.initState();
    getapidata();
  }

  void getapidata({String? search = "news"}) async {
    await Provider.of<New>(context, listen: false).fetchapidata();
    setState(() {
      //getapidata();
    });
  }

  TextEditingController searchControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var newsprovider = Provider.of<New>(context);
    return Scaffold(
      backgroundColor: Colorconstant.bgcolor,
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text("NEWS"),
        centerTitle: true,
      ),
      body: newsprovider.isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      onChanged: (value) {
                        getapidata(search: searchControler.text);
                      },
                      controller: searchControler,
                      decoration: InputDecoration(
                        hintText: "SEARCH ",
                        labelText: "SEARCH ",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                  ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: newsprovider.newsarticles?.length,
                    itemBuilder: (context, index) => Container(
                        child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(newsprovider
                                        .newsarticles?[index].urlToImage ??
                                    "NO IMAGE"),
                              ),
                            ),
                          ),
                          Text(
                            maxLines: 1,
                            newsprovider.newsarticles?[index].title ?? "",
                            style: TextStyle(fontSize: 30),
                          ),
                          Text(
                            maxLines: 10,
                            newsprovider.newsarticles?[index].description ?? "",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    )),
                  ),
                ],
              ),
            ),
    );
  }
}
