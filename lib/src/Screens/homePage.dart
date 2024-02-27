import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:provider_api_call/src/service/api_provider.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    final getData = Provider.of<ApiProvider>(context, listen: false);
    getData.getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final getData = Provider.of<ApiProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 166, 158, 189),
        title: const Text("Product Provider"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: getData.loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: getData.getList.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    title: Text(getData.getList[i]['title']),
                    subtitle: Text(getData.getList[i]["description"].toString()),
                  );
                },
              ),
      ),
    );
  }
}
