import 'dart:convert';
import 'dart:io';

class Food {
  final String name;
  final String location;
  final String description;
  String imageUrl;

  int rating = 10;

  Food(this.name, this.location, this.description);

  Future getImageUrl() async {
    // Null check so our app isn't doing extra work.
    // If there's already an image, we don't need to get one.
    if (imageUrl != null) {
      return;
    }

    HttpClient http = HttpClient();
    try {
      // Use darts Uri builder
      var uri = Uri.http('dog.ceo', '/api/breeds/image/random');
      var request = await http.getUrl(uri);
      var response = await request.close();
      var responseBody = await response.transform(utf8.decoder).join();
      // The dog.ceo API returns a JSON object with a property
      // called 'message', which actually is the URL.
      imageUrl = json.decode(responseBody)['message'];
    } catch (exception) {
      print(exception);
    }
  }
}
