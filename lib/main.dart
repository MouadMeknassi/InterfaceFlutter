import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GlobalKey<FormState> formKey = GlobalKey();
  String devicename = 'DELL';
  TextEditingController test= TextEditingController();
  int totale=0;
  bool reduction=false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold (
        appBar:AppBar(
          title:Text("Acheter un pc portable")
        ),
        body: Container(
          margin: EdgeInsets.all(30),
          child: Column(
            children: [
              Text("Quantité"),
              SizedBox(height: 15),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: test,
                      validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ce champ ne peut pas être vide';
                          }
                          return null;
                      },  
                      //onChanged: (value){t=value;},
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                      label: Text("Quantité",style: TextStyle(color: Colors.red),),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Colors.red
                          )
                        ),
                        focusedBorder:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Colors.green
                          )
                        )   
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                     children: [
                       Radio<String>(
                      value: 'DELL',
                      groupValue: devicename,
                      onChanged: (value) {
                        setState(() {
                          devicename = value!;
                        });
                      },
                    ),
                    Text('DELL'),
                     ],   
                    ),
                    Row(
                     children: [
                       Radio<String>(
                      value: 'HP',
                      groupValue: devicename,
                      onChanged: (value) {
                        setState(() {
                          devicename = value!;
                        });
                      },
                    ),
                    Text('HP'),
                     ],   
                    ),
                    Row(
                     children: [
                       Radio<String>(
                      value: 'LENOVO',
                      groupValue: devicename,
                      onChanged: (value) {
                        setState(() {
                          devicename = value!;
                        });
                      },
                    ),
                    Text('LENOVO'),
                     ],   
                    ),
                    SizedBox(height: 13),
                    Row(
                      children: [
                        Text('Réduction :'),
                        SizedBox(width: 10),
                        Checkbox(
                          value: reduction,
                          onChanged: (value) {
                            setState(() {
                              reduction = value!;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    MaterialButton(
                      onPressed:(){
                        if (formKey.currentState!.validate()) {
                          print(test.text);
                          int qte= int.parse(test.text); 
                          switch(devicename){
                            case 'DELL': 
                              totale=7000*qte;
                              break;
                            case 'HP': 
                              totale=6000*qte;
                              break;
                            case 'LENOVO':
                              totale=5000*qte;
                              break;
                          }
                          if(reduction && qte>1){
                            totale-=500;
                          }
                          setState(() {
                            
                          });
                          
                        }else{
                          totale=0;
                          setState(() {
                            
                          });
                        }
                      },
                      padding: EdgeInsets.all(16),
                      child: Text("Calculer"),
                      textColor: Colors.white,
                      color: Colors.red,
                    ),
                    SizedBox(height: 25),
                    Center(
                      child:Text(totale.toString())
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}