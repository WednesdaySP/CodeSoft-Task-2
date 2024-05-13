// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class QuotesPage extends StatefulWidget {
//   const QuotesPage({super.key});

//   @override
//   State<QuotesPage> createState() => _QuotesPageState();
// }

// class _QuotesPageState extends State<QuotesPage> {
//   String quote, author;
//   bool working=false;
//   final grey=Colors.blueGrey[800];
//   ScreenshotController screenshortController;

//   @override
//   void initState(){
//     super.initState();
//     screenshortController=screenshortController();
//     quote="";
//     author="";
//     getQuote();
//   }

//   getQuote() async{
//     try{
//       setState(() {
//         working=true;
//         quote=author="";
//       });
//       var response=await http.post(
//        // https://type.fit/api/quotes 
//         Uri.encodeFull('http://api.forismatic.com/api/1.0/'),
//         body:{"method": "getQuote","format":"json","lang":"en"}
//       );

//       setState(() {
//         try{
//           var res=jsonDecode(response.body);
//           author=res["author"].toString().trim();
//           quote=res["quote"].replaceAll("a","");
//         }catch (e){getQuote();}
//       });
//     }catch (e){offline();}
//   }

//   offline(){
//     setState(() {
      
//     });
//   }
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }