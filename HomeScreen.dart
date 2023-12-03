import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Person> persons = [
    Person('John', 'Software Engineer', 'assets/picture2.png'),
    Person('Emma', 'Product Manager', 'assets/picture4.png'),
    Person('Michael', 'Data Scientist', 'assets/picture5.png'),
    Person('Sophia', 'UX Designer', 'assets/picture6.png'),
    Person('William', 'Software Developer', 'assets/picture7.png'),
    Person('Olivia', 'Marketing Specialist', 'assets/picture8.png'),
    Person('Daniel', 'System Analyst', 'assets/picture9.png'),
    Person('Ava', 'Graphic Designer', 'assets/picture10.png'),
    Person('Matthew', 'Network Administrator', 'assets/picture11.png'),
    Person('Isabella', 'Business Analyst', 'assets/picture12.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slidable List View'),
        centerTitle: true,
        backgroundColor: Color(0xFF164863),
      ),
      body: ListView.builder(
        itemCount: persons.length,
        itemBuilder: (BuildContext context, int index) {
          return Slidable(
            startActionPane: ActionPane(
              motion: ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: ((context) {
                    showCustomSnackBar(context, 'You Can Now Start Chatting');
                  }),
                  icon: Icons.waving_hand,
                  backgroundColor: Color(0xFF164863),
                  label: 'Say Hi...',
                ),
                SlidableAction(
                  onPressed: ((context) {
                    showCustomSnackBar(context, 'Added To Your Friends List');
                  }),
                  icon: Icons.person_add,
                  backgroundColor: Colors.yellow,
                  label: 'Add Friend',
                ),
              ],
            ),
            endActionPane: ActionPane(
              motion: ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: ((context) {
                    showCustomSnackBar(context, 'Removed');
                  }),
                  icon: Icons.not_interested,
                  backgroundColor: Colors.red,
                  label: 'Not Intrested',
                ),
              ],
            ),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 0.5),
                color: Color(0xFFDDF2FD),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: ListTile(
                  title: Text(
                    persons[index].name,
                    style: TextStyle(
                        color: Color(0xFF164863),
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  ),
                  subtitle: Text(persons[index].designation),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image.asset(persons[index].imagePath),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Person {
  String name;
  String designation;
  String imagePath;

  // Constructor
  Person(this.name, this.designation, this.imagePath);
}

void showCustomSnackBar(BuildContext context, String titleMessage) {
  // Use the ScaffoldMessenger to show the SnackBar
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(titleMessage),
      duration: Duration(seconds: 5),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          print('Snack Bar Undo Clicked');
        },
      ),
    ),
  );
}
