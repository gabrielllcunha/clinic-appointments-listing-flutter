import 'package:flutter/material.dart';
import 'package:clinic_appointments_listing_flutter/list.dart';

class Appointments extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
  
class _HomeState extends State<Appointments> {

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController hourController = TextEditingController();
  TextEditingController doctorController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  String _infoText = "Please fill correctly all the fields";
  String name;
  String date;
  String hour;
  String doctor;
  String phoneNumber;
  String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Clinic Appointments:"),
        centerTitle: true,
        backgroundColor: Colors.red,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh),
            onPressed: () {
              _resetValues();
            },
          )
        ],
      ),
      backgroundColor: Colors.red,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildTextFormFieldNome(),
              buildTextFormFieldData(),
              buildTextFormFieldHora(),
              buildTextFormFieldMedico(),
              buildTextFormFieldTelefone(),
              buildTextFormFieldEmail(),
              buildContainerButtonCreateAppointment(context),
              buildContainerButtonListAppointment(context)
              buildTextInfo(),
            ]
          )
        )
      )
    );
  }
 
  buildTextFormFieldName(){
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Name",
        labelStyle: TextStyle(color: Colors.black,
          fontSize: 25.0
        ),
      ),
      style: TextStyle(fontSize: 35.0),
      controller: nameController,
      validator: (value){
        if(value.isEmpty){
          return 'Please enter the name';
        }
        return null;
      }
    );
  }

  buildTextFormFieldDate(){
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Date",
        labelStyle: TextStyle(color: Colors.black,
          fontSize: 25.0
        )
      ),
      style: TextStyle(fontSize: 35.0),
      controller: dateController,
      validator: (value){
        if(value.isEmpty){
          return 'Please enter the date';
        }
        return null;
      }
    );
  }

    buildTextFormFieldHour(){
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Hour",
        labelStyle: TextStyle(color: Colors.black,
          fontSize: 25.0
        )
      ),
      style: TextStyle(fontSize: 35.0),
      controller: hourController,
      validator: (value){
        if(value.isEmpty){
          return 'Please enter the hour';
        }
        return null;
      }
    );
  }

  buildTextFormFieldDoctor(){
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Doctor",
        labelStyle: TextStyle(color: Colors.black,
          fontSize: 25.0
        )
      ),
      style: TextStyle(fontSize: 35.0),
      controller: doctorController,
      validator: (value){
        if(value.isEmpty){
          return 'Please enter the doctor';
        }
        return null;
      }
    );
  }

  buildTextFormFieldPhoneNumber(){
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Phone Number",
        labelStyle: TextStyle(color: Colors.black,
          fontSize: 25.0
        )
      ),
      style: TextStyle(fontSize: 35.0),
      controller: phoneNumberController,
      validator: (value){
        if(value.isEmpty){
          return 'Please enter the phone number';
        }
        return null;
      }
    );
  }

  buildTextFormFieldEmail(){
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Email",
        labelStyle: TextStyle(color: Colors.black,
          fontSize: 25.0
        )
      ),
      style: TextStyle(fontSize: 35.0),
      controller: emailController,
      validator: (value){
        if(value.isEmpty){
          return 'Please enter the email';
        }
        return null;
      }
    );
  }

  buildContainerButtonCreateAppointment(BuildContext context){
    return Container(
      child: RaisedButton(
        onPressed: (){
          if(_formkey.currentState.validate()){
            _catchRecords();
            Focus.of(context).requestFocus(new FocusNode());
          }
        },
        child: Text("Create Appointment",
          style: TextStyle(color: Colors.white,
            fontSize: 35.0
            )
        ),
        color: Colors.blue
      ),
    );
  }

    buildContainerButtonListAppointment(BuildContext context){
    return Container(
      child: RaisedButton(
        onPressed: (){
           Navigator.push(
          context, MaterialPageRoute(builder: (context) => List(text: this.name)
          ),
        );
        },
        child: Text("Clinic Appointments",
          style: TextStyle(color: Colors.white,
            fontSize: 35.0
            )
        ),
        color: Colors.blue
      ),
    );
  }

  buildTextInfo(){
     return Text(_infoText,
      textAlign: TextAlign.left,
      style: TextStyle(color: Colors.black,
        fontSize: 12.5
        ),
     );
  }

  _catchRecords(){
    setState(() {
      this.name = nameController.text;
      this.date = dateController.text;
      this.hour = hourController.text;
      this.doctor = doctorController.text;
      this.phoneNumber = phoneNumberController.text;
      this.email = emailController.text;
    _resetValues();
    });
  }

  _resetValues(){
    setState(() {
      nameController.text="";
      dateController.text="";
      hourController.text="";
      doctorController.text="";
      phoneNumberController.text="";
      emailController.text="";
      _infoText="Enter the inputs";
    });
  }
}