import 'package:flutter/material.dart';
// import 'package:navbar_jurident/changetheme.dart';
// import 'package:navbar_jurident/hamburger.dart';
// import 'account.dart';
// import 'calendar.dart';
// import 'home.dart';
// import 'news.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int currentTab=0;

  //the below code declares a constant (final) variable named screen that holds a
  // list (List) of objects of type Widget.
  final List<Widget> screens=[
    const Home(),
    const News(),
    const Calendar(),
    const Account(),
    const Addition(),

  ];

  // PageStorageBucket
  // It represents a storage bucket used to store and restore the state of widgets.
  //below lines of code is often used when you need to store and restore the state
  // of widgets in Flutter applications, typically in scenarios where you have multiple
  // screens or pages and want to persist their state when navigating between them.
  final PageStorageBucket bucket=PageStorageBucket();
  Widget currentScreen=const Home();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: PageStorage(
        bucket: bucket,
        child:currentScreen ,
      ),
      // floatingActionButton: FloatingActionButton(
      //
      //   child: const Icon(Icons.add_rounded,color: Colors.white,size: 35,),
      //   //Try adding the 'const' keyword to the constructor invocation.
      //   onPressed: (){
      //     setState(() {
      //       currentScreen=const Addition();
      //       currentTab=4;
      //     });
      //
      //   },
      //   backgroundColor: const Color(0xFFC99F4A),
      // ),
      floatingActionButton: Material(
        shape: const CircleBorder(),
        color: const Color(0xFFC99F4A),
        child: IconButton(
          onPressed: () {
            setState(() {
              currentScreen = const Addition();
              currentTab = 4;
            });
          },
          icon: const Icon(Icons.add_rounded, color: Colors.white, size: 35),
        ),
      ),


      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: SizedBox(
        height: 68,
        child: BottomAppBar(

          shape: const CircularNotchedRectangle(), //represents a rectangular shape with a circular notch at the bottom
          color: Colors.black,
          notchMargin: 8,
          child: Container(
            height: 70,
            // color: Colors.black,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    MaterialButton(
                      onPressed: (){
                        setState(() {
                          currentScreen=Home();
                          currentTab=0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.home,
                            color: currentTab==0?Color(0xFFC99F4A): Colors.white,
                          ),
                          Text('Home',style: TextStyle(
                            color: currentTab==0? Color(0xFFC99F4A) : Colors.white,
                          ),)
                        ],
                      ),
                    ),
                    MaterialButton(
                      onPressed: (){
                        setState(() {
                          currentScreen=const News();
                          currentTab=1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.newspaper,
                            color: currentTab==1? const Color(0xFFC99F4A) : Colors.white,
                          ),
                          Text('News',style: TextStyle(
                            color: currentTab==1? const Color(0xFFC99F4A): Colors.white,
                          ),)
                        ],
                      ),
                    ),
                  ],
                ),
                //Right Tab Bar Icons
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                      onPressed: (){
                        setState(() {
                          currentScreen=const Calendar();
                          currentTab=2;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.calendar_month,
                            color: currentTab==2?Color(0xFFC99F4A) : Colors.white,
                          ),
                          Text('Calendar',style: TextStyle(
                            color: currentTab==2? Color(0xFFC99F4A) : Colors.white,
                          ),)
                        ],
                      ),
                    ),
                    MaterialButton(
                      onPressed: (){
                        setState(() {
                          currentScreen=const Account();
                          currentTab=3;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person,
                            color: currentTab==3?Color(0xFFC99F4A) : Colors.white,
                          ),
                          Text('Account',style: TextStyle(
                            color: currentTab==3? Color(0xFFC99F4A): Colors.white,
                          ),)
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
class Addition extends StatefulWidget {
  const Addition({Key? key}) : super(key: key);

  @override
  State<Addition> createState() => _AdditionState();
}

class _AdditionState extends State<Addition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const Hamburger(),
      appBar: AppBar(
        title: Center( child: Text('Addition')),
      ),
      body: const Center(
        child: Text('Addition Screen', style: TextStyle(fontSize: 40),),
      ),

    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final text = MediaQuery
        .of(context)
        .platformBrightness == Brightness.light
        ? 'DarkTheme'
        : 'LightTheme';
    return Scaffold(
      // drawer: const Hamburger(),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(child: Text('Home')),
        // actions: [
        //   ChangeThemeButtonWidget(),
        // ],
      ),
      body: Center(
        child: Text('hello $text',
          style: TextStyle(
            fontSize: 40,
          ),
        ),
      ),

    );
  }
}

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const Hamburger(),
      appBar: AppBar(
        title: Center(child: Text('Account')),
      ),
      body: const Center(
        child: Text('Accounts Screen', style: TextStyle(fontSize: 40),),
      ),

    );
  }
}


class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const Hamburger(),
      appBar: AppBar(
        title: const Center(child: Text('Calendar')),
      ),
      body: const Center(
        child: Text('Calendar Screen ', style: TextStyle(fontSize: 40),),
      ),

    );
  }
}


class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const Hamburger(),
      appBar: AppBar(
        title: const Center(child: Text('News')),
      ),
      body: const Center(
        child: Text('News Screen ', style: TextStyle(fontSize: 40),),
      ),

    );
  }
}




