import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Slivers());
}

class Slivers extends StatelessWidget {
  const Slivers({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            //! SliverAppBar
            const SliverAppBar(
              // title: Text('Sliver App Bar'),
              // centerTitle: true,
              backgroundColor: Colors.black,
              // toolbarHeight: 100,
              expandedHeight:
                  150, //<<--- This is the height of AppBar totally (expandedHeight + default ).
              floating: true, //<<--- AppBar appears immediately.
              snap: true, //<<-- AppBar displayed 0% or 100%.
              pinned: true, //<<-- AppBar pinned to the top.
              flexibleSpace: FlexibleSpaceBar(
                // background: Image.network(
                //   'https://wallpapers.com/images/high/naruto-pictures-6pe7ytm74dlzc4ew.webp',
                //   fit: BoxFit.cover,
                // ),
                title: Text('Sliver App Bar'),
                centerTitle: true,
                collapseMode: CollapseMode.none,
              ),
              // shape: const RoundedRectangleBorder(
              //   borderRadius: BorderRadiusDirectional.only(
              //     bottomEnd: Radius.circular(25),
              //     bottomStart: Radius.circular(25),
              //   ),
              // ),
            ),

            /// SliverPersistentHeader
            /// SliverChildListDelegate is equivalent to ListView
            SliverFixedExtentList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    color: Colors.green,
                    alignment: Alignment.center,
                    child: const Text(
                      'SliverFixedExtentList',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  Container(color: Colors.blue[600]),
                  Container(
                    color: Colors.redAccent,
                  ),
                ],
              ),
              itemExtent: 60,
            ),

            /// SliverList
            ///  SliverChildBuilderDelegate is equivalent to ListView.builder
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Container(
                    height: 50,
                    alignment: Alignment.center,
                    color: Colors.orange[100 * (index % 10)],
                    child: Text('SliverList $index'),
                  );
                },
                childCount: 10,
              ),
            ),
            //! SliverGrid
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.teal[100 * (index % 10)],
                    child: Text('SliverGrid $index'),
                  );
                },
                childCount: 10,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
            ),
            //! SliverToBoxAdapter
            SliverToBoxAdapter(
              child: Container(
                alignment: AlignmentDirectional.center,
                height: 60,
                color: Colors.deepPurpleAccent,
                child: const Text(
                  'SliverToBoxAdapter',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
