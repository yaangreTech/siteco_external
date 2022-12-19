import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

Map<String, String> _headers = {
  'Content-type': 'application/json',
  'Accept': 'application/json',
};

//base name of the API link
//const String root = "https://ytech-bf.com/siteco/public/api/";

class CustomException implements Exception {
  static const SERVER_STATUS_CODE = [
    {
      "status": "100",
      "message": "Continue",
      "description": " This means that the server in question has received your browser’s request headers, and is now ready for the request body to be sent as well. This makes the request process more efficient since it prevents the browser from sending a body request even though the headers have been rejected."
    },
    {
      "status": "101",
      "message": "Switching protocols",
      "description": " Your browser has asked the server to change protocols, and the server has complied."
    },
    {
      "status": "103",
      "message": "Early hints",
      "description": " This returns some response headers before the rest of the server’s response is ready."
    },
    {
      "status": "200",
      "message": "Everything is OK",
      "description": " This is the code that is delivered when a web page or resource acts exactly the way it’s expected to."
    },
    {
      "status": "201",
      "message": "Created",
      "description": " The server has fulfilled the browser’s request, and as a result, has created a new resource."
    },
    {
      "status": "202",
      "message": "Accepted",
      "description": " The server has accepted your browser’s request but is still processing it. The request ultimately may or may not result in a completed response."
    },
    {
      "status": "203",
      "message": "Non-Authoritative Information",
      "description": " This status code may appear when a proxy is in use. It means that the proxy server received a 200 “Everything is OK” status code from the origin server, but has modified the response before passing it on to your browser."
    },
    {
      "status": "204",
      "message": "No Content",
      "description": " This code means that the server has successfully processed the request, but is not going to return any content."
    },
    {
      "status": "205",
      "message": "Reset Content",
      "description": " Like a 204 code, this means that how server has processed the request but is not going to return any content. However, it also requires that your browser resets the document view."
    },
    {
      "status": "206",
      "message": "Partial Content",
      "description": " You may see this status code if your HTTP client (also known as your browser) uses ‘range headers’. This enables your browser to resume paused downloads, as well as to split a download into multiple streams. A 206 code is sent when a range header causes the server to send only part of the requested resource."
    },
    {
      "status": "300",
      "message": "Multiple Choices",
      "description": " Sometimes, there may be multiple possible resources the server can respond with to fulfill your browser’s request. A 300 status code means that your browser now needs to choose between them. This may occur when there are multiple file type extensions available, or if the server is experiencing word sense disambiguation."
    },
    {
      "status": "301",
      "message": "The requested resource has been moved permanently",
      "description": " This code is delivered when a web page or resource has been permanently replaced with a different resource. It is used for permanent URL redirection."
    },
    {
      "status": "302",
      "message": "The requested resource has moved, but was found",
      "description": " This code is used to indicate that the requested resource was found, just not at the location where it was expected. It is used for temporary URL redirection."
    },
    {
      "status": "303",
      "message": "See Other",
      "description": " Understanding a 303 status code requires that you know the difference between the four primary HTTP request methods. Essentially, a 303 code tells your browser that it found the resource your browser requested via POST, PUT, or DELETE. However, to retrieve it using GET, you need to make the appropriate request to a different URL than the one you previously used."
    },
    {
      "status": "304",
      "message": "The requested resource has not been modified since the last time you accessed it",
      "description": " This code tells the browser that the resources stored in the browser cache haven’t changed. It’s used to speed up web page delivery by reusing previously-downloaded resources."
    },
    {
      "status": "307",
      "message": "Temporary Redirect",
      "description": " This status code has replaced 302 “Found” as the appropriate action when a resource has been temporarily moved to a different URL. Unlike the 302 status code, it does not allow the HTTP method to change."
    },
    {
      "status": "308",
      "message": "Permanent Redirect",
      "description": " The 308 status code is the successor to the 301 “Moved Permanently” code. It does not allow the HTTP method to change and indicates that the requested resource is now permanently located at a new URL."
    },
    {
      "status": "400",
      "message": "Bad Request",
      "description": " The server can’t return a response due to an error on the client’s end. See our guide for resolving this error."
    },
    {
      "status": "401",
      "message": "Unauthorized” or ",
      "description": " This is returned by the server when the target resource lacks valid authentication credentials. You might see this if you’ve set up basic HTTP authentication using htpasswd."
    },
    {
      "status": "402",
      "message": "Payment Required",
      "description": " Originally, this code was created for use as part of a digital cash system. However, that plan never followed through. Instead, it’s used by a variety of platforms to indicate that a request cannot be fulfilled, usually due to a lack of required funds. Common instances include"
    },
    {
      "status": "403",
      "message": "Access to that resource is forbidden",
      "description": " This code is returned when a user attempts to access something that they don’t have permission to view. For example, trying to reach password-protected content without logging in might produce a 403 error."
    },
    {
      "status": "404",
      "message": "The requested resource was not found",
      "description": " This is the most common error message of them all. This code means that the requested resource does not exist, and the server does not know if it ever existed."
    },
    {
      "status": "405",
      "message": "Method not allowed",
      "description": " This is generated when the hosting server (origin server) supports the method received, but the target resource doesn’t."
    },
    {
      "status": "406",
      "message": "Not acceptable response",
      "description": " The requested resource is capable of generating only content that is not acceptable according to the accept headers sent in the request."
    },
    {
      "status": "407",
      "message": "Proxy Authentication Required",
      "description": " A proxy server is in use and requires your browser to authenticate itself before continuing."
    },
    {
      "status": "408",
      "message": "The server timed out waiting for the rest of the request from the browser",
      "description": " This code is generated when a server times out while waiting for the complete request from the browser. In other words, the server didn’t get the full request that was sent by the browser. One possible cause could be net congestion resulting in the loss of data packets between the browser and the server."
    },
    {
      "status": "409",
      "message": "Conflict",
      "description": " A 409 status code means that the server couldn’t process your browser’s request because there’s a conflict with the relevant resource. This sometimes occurs due to multiple simultaneous edits."
    },
    {
      "status": "410",
      "message": "The requested resource is gone and won’t be coming back",
      "description": " This is similar to a 404 “Not Found” code, except a 410 indicates that the condition is expected and permanent."
    },
    {
      "status": "411",
      "message": "Length Required",
      "description": " This means that the requested resource requires that the client specify a certain length and that it did not."
    },
    {
      "status": "412",
      "message": "Precondition Failed",
      "description": " Your browser included certain conditions in its request headers, and the server did not meet those specifications."
    },
    {
      "status": "413",
      "message": "Payload Too Large” or ",
      "description": " Your request is larger than the server is willing or able to process."
    },
    {
      "status": "414",
      "message": "URI Too Long",
      "description": " This is usually the result of a GET request that has been encoded as a query string that is too large for the server to process."
    },
    {
      "status": "415",
      "message": "Unsupported Media Type",
      "description": " The request includes a media type that the server or resource doesn’t support."
    },
    {
      "status": "416",
      "message": "Range Not Satisfiable",
      "description": " Your request was for a portion of a resource that the server is unable to return."
    },
    {
      "status": "417",
      "message": "Expectation Failed",
      "description": " The server is unable to meet the requirements specified in the request’s expect header field."
    },
    {
      "status": "418",
      "message": "I’m a teapot",
      "description": " This code is returned by teapots that receive requests to brew coffee. It’s also an April Fool’s Joke from 1998."
    },
    {
      "status": "422",
      "message": "Unprocessable Entity",
      "description": " The client request contains semantic errors, and the server can’t process it."
    },
    {
      "status": "425",
      "message": "Too Early",
      "description": " This code is sent when the server is unwilling to process a request because it may be replayed."
    },
    {
      "status": "426",
      "message": "Upgrade Required",
      "description": " Due to the contents of the request’s upgrade header field, the client should switch to a different protocol."
    },
    {
      "status": "428",
      "message": "Precondition Required",
      "description": " The server requires conditions to be specified before processing the request."
    },
    {
      "status": "429",
      "message": "Too many requests",
      "description": " This is generated by the server when the user has sent too many requests in a given amount of time (rate-limiting). This can sometimes occur due to bots or scripts attempting to access your site. In this case, you might want to try changing your WordPress login URL. You can also check out our guide to fixing a 429 “Too Many Requests” error."
    },
    {
      "status": "431",
      "message": "Request Header Fields Too Large",
      "description": " The server can’t process the request because the header fields are too large. This may indicate a problem with a single header field, or all of them collectively."
    },
    {
      "status": "451",
      "message": "Unavailable for Legal Reasons",
      "description": " The operator of the server has received a demand to prohibit access to the resource you’ve requested (or a set of resources including the one you’ve requested). Fun fact"
    },
    {
      "status": "499",
      "message": "Client closed request",
      "description": " This is returned by NGINX when the client closes the request while Nginx is still processing it.500-level status codes are also considered errors. However, they denote that the problem is on the server’s end. This can make them more difficult to resolve."
    },
    {
      "status": "500",
      "message": "There was an error on the server and the request could not be completed",
      "description": " This is generic code that simply means “internal server error”. Something went wrong on the server and the requested resource was not delivered. This code is typically generated by third-party plugins, faulty PHP, or even the connection to the database breaking. Check out our tutorials on how to fix the error establishing a database connection and other ways to resolve a 500 internal server error."
    },
    {
      "status": "501",
      "message": "Not Implemented",
      "description": " This error indicates that the server does not support the functionality required to fulfill the request. This is almost always a problem on the web server itself, and usually must be resolved by the host. Check out our recommendations on how to resolve a 501 not implemented error."
    },
    {
      "status": "502",
      "message": "Bad Gateway",
      "description": " This error code typically means that one server has received an invalid response from another, such as when a proxy server is in use. Other times a query or request will take too long, and so it is canceled or killed by the server and the connection to the database breaks. For more details, see our in-depth tutorial on how to fix the 502 Bad Gateway error."
    },
    {
      "status": "503",
      "message": "The server is unavailable to handle this request right now",
      "description": " The request cannot be completed at this point in time. This code may be returned by an overloaded server that is unable to handle additional requests. We have a full guide on how to fix the 503 Service Unavailable Error."
    },
    {
      "status": "504",
      "message": "The server, acting as a gateway, timed out waiting for another server to respond",
      "description": " This is the code returned when there are two servers involved in processing a request, and the first server times out waiting for the second server to respond. You can read more about how to fix 504 errors in our dedicated guide."
    },
    {
      "status": "505",
      "message": "HTTP Version Not Supported",
      "description": " The server doesn’t support the HTTP version the client used to make the request."
    },
    {
      "status": "508",
      "message": "Resource Limit Is Reached",
      "description": " limits on resources set by your web host have been reached."
    },
    {
      "status": "509",
      "message": "Bandwidth Limit Exceeded",
      "description": " means your website is using more bandwidth than your hosting provider allows."
    },
    {
      "status": "511",
      "message": "Network Authentication Required",
      "description": " This status code is sent when the network you’re trying to use requires some form of authentication before sending your request to the server. For instance, you may need to agree to the Terms and Conditions of a public Wi-Fi hotspot."
    },
    {
      "status": "521",
      "message": "Web server is down",
      "description": " Error 521 is a Cloudflare-specific error message. It means that your web browser was able to successfully connect to Cloudflare, but Cloudflare was not able to connect to the origin web server."
    },
    {
      "status": "525",
      "message": "SSL Handshake Failed",
      "description": " Error 525 means that the SSL handshake between a domain using Cloudflare and the origin web server failed. If you are experiencing issues there are five methods you can try to easily fix error 525."
    }
  ];
  String message="";
  int status=200;
  CustomException({required int status})
  {
    this.status = status;
    //index of the status
    int index = SERVER_STATUS_CODE.indexWhere((item) => item["status"]==status.toString());
    this.message = SERVER_STATUS_CODE[index]["message"] ?? "";

  }

  //getter of the status
  int get Status => status;

  //getter of the message
  String get Message => message;

  @override
  String toString()
  {
    return "{${status}:${message}}";
  }
}

class Services {
  //base name of the API link
  static const root = "https://ytech-bf.com/siteco/public/api/";

  static Future getData({required String apiURL}) async
  {
    //will keep data fetched
    Map<String, dynamic> data = const {};

    try
    {
      String finalURL = root + apiURL;
      final response = await http.get(Uri.parse(finalURL), headers: _headers);

      if (response.statusCode == 200)
      {
        Map data = {'status': '200', 'data': json.decode(response.body)};
        return data;
      }
      else
      {
        throw CustomException(status: response.statusCode);
      }
    }
    on CustomException catch (e)
    {
      data = {'status': e.Status, 'message': e.Message, 'data': ""};
      return Future.error(data);
    }
    catch (e)
    {
      return Future.error(data);
    }
  }
}


// void getData({required Function callback, required String url}) async
// {
//   Response response = await get(Uri.parse(url));
//   callback(jsonDecode(response.body));
// }

