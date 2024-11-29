
import 'package:flutter/material.dart';

class StatefulLifecycleScreen extends StatefulWidget {
  const StatefulLifecycleScreen({super.key});

  @override
  State<StatefulLifecycleScreen> createState(){
    print('Create State Method called');
    return _StatefulLifecycleScreenState();
  }
}

class _StatefulLifecycleScreenState extends State<StatefulLifecycleScreen> {

  @override
  void dispose() {
    super.dispose();
    print('Dispose Method Called');
  }

  @override
  Widget build(BuildContext context) {
    print('Build Method Called');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateful Lifecycle Screen'),
      ),
      body: Container(
        color:Colors.pink,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          print('SetState Method called');
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    print('Init Method Called');
  }

  @override
  void didUpdateWidget(covariant StatefulLifecycleScreen oldWidget) {
    print('didUpdateWidget method called');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void reassemble() {
    super.reassemble();
    print('reassemble called');
  }
}
