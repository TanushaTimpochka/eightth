import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(MyApp());
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => Main(),
    ),
    GoRoute(path: "/page1", builder: (context, state) => Page1()),
    GoRoute(path: "/page2", builder: (context, state) => Page2())
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Pages',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () => context.go("/"), child: Text("Main Page")),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () => context.go("/page1"), child: Text("Page 1")),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () => context.go("/page2"), child: Text("Page 2")),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () => Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Page3())),
                  child: Text("Page 3")),
              const SizedBox(
                height: 20,
              ),
              CachedNetworkImage(
                imageUrl:
                "https://previews.123rf.com/images/rawpixel/rawpixel1705/rawpixel170569587/79251403-%D1%81%D0%B2%D0%BE%D0%B1%D0%BE%D0%B4%D0%BD%D1%8B%D0%B9-%D1%82%D0%B5%D0%BA%D1%81%D1%82-%D1%84%D1%80%D0%B0%D0%B7%D1%8B-%D0%BD%D0%B0-%D0%BE%D1%82%D0%BA%D1%80%D1%8B%D1%82%D0%BE%D0%BC-%D0%B2%D0%BE%D0%B7%D0%B4%D1%83%D1%85%D0%B5.jpg",
                height: 300,
                width: 500,
                errorWidget: (context, url, widget) => const Center(
                    child: Icon(
                      Icons.error,
                      color: Colors.red,
                    )),)
            ],
          )),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 2'),
        backgroundColor: Colors.green,
      ),
      body: Center(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () => context.go("/"), child: Text("Main Page")),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () => context.go("/page1"), child: Text("Page 1")),
              const SizedBox(
                height: 20,
              ),
              CachedNetworkImage(
                imageUrl:
                "https://previews.123rf.com/images/rawpixel/rawpixel1612/rawpixel161205079/66614961-tattoo-camera-photography-media-creative-film-concept.jpg",
                height: 300,
                width: 500,
                errorWidget: (context, url, widget) => const Center(
                    child: Icon(
                      Icons.error,
                      color: Colors.red,
                    )),)
            ],
          )),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
        backgroundColor: Colors.red,
      ),
      body: Center(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () => context.go("/"), child: Text("Main Page")),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () => context.go("/page2"), child: Text("Page 2")),
              const SizedBox(
                height: 20,
              ),
              CachedNetworkImage(
                imageUrl:
                "https://previews.123rf.com/images/paylessimages/paylessimages0912/paylessimages091202065/47135928-two-women-walk-through-attraction.jpg",
                height: 300,
                width: 500,
                errorWidget: (context, url, widget) => const Center(
                    child: Icon(
                      Icons.error,
                      color: Colors.red,
                    )),)
            ],
          )),
    );
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 3'),
        backgroundColor: Colors.limeAccent,
      ),
      body: Center(
          child: Column (
            children: [ElevatedButton(
                onPressed: () => Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Page31())),
                child: Text("Page 3.1")),
              CachedNetworkImage(
                imageUrl:
                "https://previews.123rf.com/images/galina2703/galina27031706/galina2703170600218/79599761-yekaterinburg-russia-september-24-2016-beautiful-views-of-the-city-from-the-observation-deck-52.jpg",
                height: 300,
                width: 500,
                errorWidget: (context, url, widget) => const Center(
                    child: Icon(
                      Icons.error,
                      color: Colors.red,
                    )),)
            ],
          )
      ),
    );
  }
}

class Page31 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 3.1'),
        backgroundColor: Colors.purple,
      ),
      body: Center(
          child: Column(
            children: [TextButton(
              child: const Text('Go back'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
              CachedNetworkImage(
                imageUrl:
                "https://previews.123rf.com/images/mbsonline/mbsonline1808/mbsonline180800002/115729722-silhouetted-couple-walking-on-the-beach-at-sunset-noordwijk-the-netherlands-with-copy-space-photo.jpg",
                height: 300,
                width: 500,
                errorWidget: (context, url, widget) => const Center(
                    child: Icon(
                      Icons.error,
                      color: Colors.red,
                    )),)
            ],
          )
      ),
    );
  }
}
