import 'dart:collection';
import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:http/http.dart' as http;
import 'package:quoteapp/pages/favourite_screen.dart';
import 'package:quoteapp/pages/quotes.dart';
import 'package:share_plus/share_plus.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> favoriteQuotes=[];
  bool isFavourite=false;
  List? imageList;
  int? imageNum=0;
  var accessKey="zONcwxw3Mr2wutyt9QmFEfVayKUOKIIzM5dQb27pJXY";
  List<dynamic> quotes=[];

  @override
  void initState() {
    super.initState();
    fetchUnsplashImages();
  }

  @override
  Widget build(BuildContext context) {
    var hgt=MediaQuery.of(context).size.height;
    var wdt=MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        children: [
          SpeedDialChild(
          child: Icon(Icons.share),
          onTap: () {
            // Share.share(imageList![imageNum!]['urls']['regular']);
            String quote = quoteList[imageNum!][kQuote];
            String author = quoteList[imageNum!][kAuthor];
            String imageUrl = imageList![imageNum!]['urls']['regular'];
            
            // Create a custom message with the quote, author, and image URL
            String message = '"$quote" - $author \n\n$imageUrl';
            
            // Share the message using the Share.share method
            Share.share(message);
                  },
         
        ),
        SpeedDialChild(
          child: Icon(Icons.copy),
           onTap: () {
          String quote = quoteList[imageNum!][kQuote];
          String author = quoteList[imageNum!][kAuthor];
          
          // Create a combined string with the quote and author's name
          String copiedText = '"$quote" - $author';
          
          // Copy the combined string to the clipboard
          Clipboard.setData(ClipboardData(text: copiedText));
          
          // Show a toast or snackbar to indicate that the text has been copied
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Quote copied to clipboard')),
          );
        },
        ),
        SpeedDialChild(
          child: Icon(Icons.favorite),
          onTap: () {
             Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => FavoriteQuotesScreen(favoriteQuotes: favoriteQuotes),
    ),);
          },
        
         
        ),
        ],
      ),
      body: imageList == null
        ? Center(child: CircularProgressIndicator())
        : Container(
        height: hgt,
        width: wdt,
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(image: NetworkImage(imageList![imageNum!]['urls']['regular']),fit: BoxFit.cover)
        ),
        
        child: SafeArea(
          child: CarouselSlider.builder(
            itemCount: quoteList.length, 
            itemBuilder: (context, index1, index2) {
              return Column(
                
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.favorite,
                    color: isFavourite? Colors.red:null,),
                    onPressed: addToFavorites,),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(quoteList[index1][kQuote],style: TextStyle(
                      fontSize: 25,
                      color: Colors.white.withOpacity(0.95),
                      fontWeight: FontWeight.w600,
                      
                    ),
                    textAlign: TextAlign.center,),
                  ),
                  SizedBox(height: 20,),
                  Text('- ${quoteList[index1][kAuthor]} -', style: TextStyle(
                    fontSize: 18,
                    color: Colors.white.withOpacity(0.5),
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.italic,
                  ),
                   textAlign: TextAlign.center),

                   
                ],
              );
            }, 
            options:CarouselOptions(
              scrollDirection: Axis.vertical,
              pageSnapping: true,
              initialPage: 0,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                HapticFeedback.heavyImpact();
                imageNum=index;
                setState(() {
                  
                });
              },
            ) ),
        ),
      )
    );


  }

//   void fetchUnsplashImages() async{
//   print("User found");
//   var url='https://api.unsplash.com/search/photos?per_page=30&query=nature&order_by=relevant&client_id=$accessKey';
//   final uri=Uri.parse(url);
//   var response=await http.get(uri);
//   // final body=response.body;
//   // final json=jsonDecode(body);
//   // setState((){
//   //   quotes=json['quote'];

//   // });
//   print(response.statusCode);
//   //print(response.body);
//   var unsplashData=json.decode(response.body);
//   imageList=unsplashData['result'];
//   setState(() {
    
//   });
  
// }

//onTap method for favourite icon
void addToFavorites(){
  String quote=quoteList[imageNum!][kQuote];
  String author=quoteList[imageNum!][kAuthor];

  String combinedquote='"$quote" - $author';

  //check if fav quote is already in fav to avoid duplicate
  if(!favoriteQuotes.contains(combinedquote)){
    //add to list
    favoriteQuotes.add(combinedquote);
    isFavourite=true;

    //show toast msg
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Added to favourites')),
    );
  }
  else{
    // Show a toast or snackbar to indicate that the quote is already in favorites
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Quote is already in favorites')),
      );
  }
   // Call setState to update the UI
    setState(() {});
}

void fetchUnsplashImages() async {
  var url =
      'https://api.unsplash.com/search/photos?per_page=30&query=nature&order_by=relevant&client_id=$accessKey';
  final uri = Uri.parse(url);
  try{
  var response = await http.get(uri);
  if(response.statusCode==200){
    var unsplashData = json.decode(response.body);
    if(unsplashData.containsKey('results')){
      imageList = unsplashData['results']; // Ensure 'result' is the correct key
  setState(() {});

    }
    else{
      print('Error: Results key not found in response.');
    }
    

  }
  else{
      print('Error: ${response.statusCode} - ${response.reasonPhrase}');
    }
  // print(response.statusCode); // Check the status code
  // print(response.body); // Print the response body for debugging
  
  
  }
  catch(e){
    print('Error fetching data: $e');
  }
}
}

