import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/add_place_screen.dart';
import 'package:provider/provider.dart';
import '../providers/places_provider.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Places'),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
              },
              icon: Icon(Icons.add),
            ),
          ],
        ),
        body: FutureBuilder(
          future: Provider.of<PlacesProvider>(context, listen: false)
              .fetchAndSetPlaces(),
          builder: (ctx, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Consumer<PlacesProvider>(
                      child: Center(
                        child: const Text('No places'),
                      ),
                      builder: (ctx, placesProviderData, child) {
                        final places = placesProviderData.places;
                        if (places.length <= 0) {
                          return child;
                        }
                        return ListView.builder(
                            itemCount: places.length,
                            itemBuilder: (lvContext, index) => ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: Colors.amberAccent,
                                  ),
                                  title: Text(places[index].title),
                                  onTap: () {},
                                ));
                      },
                    ),
        ));
  }
}
