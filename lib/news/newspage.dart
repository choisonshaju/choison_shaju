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

  getapidata() async {
    await Provider.of<news>(context, listen: false).fetchapidata();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var newsprovider = Provider.of<news>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("JEZT"),
        centerTitle: true,
      ),
      body: newsprovider.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
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
                          image: NetworkImage(
                              newsprovider.newsarticles?[index].urlToImage ??
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
    );
  }
}
