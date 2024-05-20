import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MyApp());
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => Main(),
    ),
    GoRoute(
        path: "/page1",
        builder: (context, state) => Page1()
    ),
    GoRoute(
        path: "/page2",
        builder: (context, state) => Page2()
    )
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
    )
    ;

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
              ElevatedButton(onPressed: () => context.go("/"), child: Text("Main Page")),
              const SizedBox(height: 20,),
              ElevatedButton(onPressed: () => context.go("/page1"), child: Text("Page 1")),
              const SizedBox(height: 20,),
              ElevatedButton(onPressed: () => context.go("/page2"), child: Text("Page 2")),
              const SizedBox(height: 20,),
              ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Page3())),
                  child: Text("Page 3")),
              const SizedBox(height: 20,),
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
              ElevatedButton(onPressed: () => context.go("/"), child: Text("Main Page")),
              const SizedBox(height: 20,),
              ElevatedButton(onPressed: () => context.go("/page1"), child: Text("Page 1")),
              const SizedBox(height: 20,),
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
              ElevatedButton(onPressed: () => context.go("/"), child: Text("Main Page")),
              const SizedBox(height: 20,),
              ElevatedButton(onPressed: () => context.go("/page2"), child: Text("Page 2")),
              const SizedBox(height: 20,),
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
        child: ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Page31())),
            child: Text("Page 3.1")),
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
        child: TextButton(
          child: const Text('Go back'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
