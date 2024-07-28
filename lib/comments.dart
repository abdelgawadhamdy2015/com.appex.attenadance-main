//  import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
// import 'package:dio/dio.dart'; // for HTTP requests with Retrofit
// import 'package:retrofit/retrofit.dart'; // for Retrofit annotations
// import 'package:flutter_bloc/flutter_bloc.dart'; // for state management (optional)

// // Retrofit service interface
// part 'api_service.g.dart';

// @RestApi(baseUrl: "https://your-api-base-url.com")
// abstract class ApiService {
//   factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

//   @POST("/send-location")
//   Future<void> sendLocation(@Body() Map<String, dynamic> locationData);
// }

// // Cubit for managing state (optional)
// abstract class LocationState {}

// class LocationInitial extends LocationState {}

// class LocationSending extends LocationState {}

// class LocationSent extends LocationState {}

// class LocationError extends LocationState {
//   final String message;
//   LocationError(this.message);
// }

// abstract class LocationEvent {}

// class SendLocationEvent extends LocationEvent {}

// class LocationCubit extends Cubit<LocationState> {
//   final ApiService _apiService;

//   LocationCubit(this._apiService) : super(LocationInitial());

//   Future<void> sendLocation(double latitude, double longitude) async {
//     emit(LocationSending());
//     try {
//       await _apiService.sendLocation({
//         'latitude': latitude,
//         'longitude': longitude,
//       });
//       emit(LocationSent());
//     } catch (e) {
//       emit(LocationError('Failed to send location: $e'));
//     }
//   }
// }

// class LocationScreen extends StatefulWidget {
//   @override
//   _LocationScreenState createState() => _LocationScreenState();
// }

// class _LocationScreenState extends State<LocationScreen> {
//   GoogleMapController? mapController;
//   LocationData? currentLocation;
//   Location location = Location();
//   ApiService? apiService;

//   @override
//   void initState() {
//     super.initState();
//     fetchLocation();
//   }

//   Future<void> fetchLocation() async {
//     try {
//       currentLocation = await location.getLocation();
//       setState(() {
//         mapController!.animateCamera(
//           CameraUpdate.newCameraPosition(
//             CameraPosition(
//               target: LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
//               zoom: 15.0,
//             ),
//           ),
//         );
//       });
//     } catch (e) {
//       print('Could not get the location: $e');
//     }
//   }

//   void sendLocationToApi() {
//     if (currentLocation != null) {
//       context.read<LocationCubit>().sendLocation(currentLocation!.latitude!, currentLocation!.longitude!);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Location Screen'),
//       ),
//       body: Stack(
//         children: [
//           GoogleMap(
//             onMapCreated: (controller) {
//               setState(() {
//                 mapController = controller;
//               });
//             },
//             initialCameraPosition: CameraPosition(
//               target: LatLng(0.0, 0.0), // Initial location (center of the map)
//               zoom: 15.0,
//             ),
//             markers: currentLocation != null ? Set<Marker>.from([
//               Marker(
//                 markerId: MarkerId('current-location'),
//                 position: LatLng(currentLocation.latitude, currentLocation.longitude),
//                 infoWindow: InfoWindow(title: 'Current Location'),
//               ),
//             ]) : Set<Marker>(),
//           ),
//           Positioned(
//             bottom: 16.0,
//             left: 16.0,
//             right: 16.0,
//             child: ElevatedButton(
//               onPressed: sendLocationToApi,
//               child: Text('Send Location to API'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Location Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: BlocProvider(
//         create: (context) => LocationCubit(ApiService(Dio())),
//         child: LocationScreen(),
//       ),
//     );
//   }
// }











// //  SafeArea(
// //         child: Padding(
// //           padding: const EdgeInsets.all(12.0),
// //           child: SingleChildScrollView(
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 SizedBox(
// //                   height: 50.h,
// //                   width: double.infinity,
// //                   child: Row(
// //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     children: [
// //                       Image.asset(
// //                         "images/apex ERP-6.png",
// //                         fit: BoxFit.fill,
// //                       ),
// //                       ElevatedButton(
// //                         onPressed: () {
// //                           if (selectedLanguage == "English") {
// //                             setState(() {
// //                               selectedLanguage = "Arabic";
// //                               changeLanguage(const Locale("ar"));
// //                             });
// //                           } else {
// //                             setState(() {
// //                               selectedLanguage = "English";
// //                               changeLanguage(const Locale("en"));
// //                             });
// //                           }
// //                         },
// //                         style: ElevatedButton.styleFrom(
// //                           shape: RoundedRectangleBorder(
// //                               borderRadius: BorderRadius.circular(20.r)),
// //                           fixedSize:
// //                               Size(100.w, 110.h), //Size.fromWidth(110.w),

// //                           backgroundColor: Colors.white,
// //                         ),
// //                         child: FittedBox(
// //                           fit: BoxFit.cover,
// //                           child: Text(
// //                             selectedLanguage,
// //                             style: TextStyles.font25BlueBold,
// //                           ),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //                 Center(
// //                   child: Container(
// //                     padding: EdgeInsets.only(top: 10.h),
// //                     child: Text(
// //                       S.of(context).login,
// //                       style: TextStyle(
// //                         fontSize: 30.sp,
// //                         fontWeight: FontWeight.bold,
// //                         color: Colors.black,
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //                 Form(
// //                   key: context.read<LoginCubit>().formKey,
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Container(
// //                         padding: const EdgeInsets.only(top: 25, bottom: 20),
// //                         child: Text(S.of(context).dbName),
// //                       ),
// //                       MyTextForm(
// //                           hint: S.of(context).dbName,
// //                           excep: S.of(context).dbName,
// //                           control: context.read<LoginCubit>().dbController),
// //                       Container(
// //                         padding: const EdgeInsets.only(top: 25, bottom: 20),
// //                         child: Text(S.of(context).email),
// //                       ),
// //                       MyTextForm(
// //                         hint: S.of(context).email,
// //                         excep: S.of(context).email,
// //                         control: context.read<LoginCubit>().emailController,
// //                       ),
// //                       Container(
// //                         padding: const EdgeInsets.only(top: 25, bottom: 20),
// //                         child: Text(S.of(context).password),
// //                       ),
// //                       PasswordText(
// //                           hint: S.of(context).password,
// //                           obsecur: true,
// //                           control:
// //                               context.read<LoginCubit>().passwordController),
// //                       SizedBox(
// //                         height: 50.h,
// //                       ),
// //                       Row(
// //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                         children: [
// //                           Row(
// //                             children: [
// //                               Text(S.of(context).rememberMe),
// //                               Checkbox(
// //                                   value: rememberMe,
// //                                   onChanged: (val) {
// //                                     setState(() {
// //                                       rememberMe = val!;
// //                                     });
// //                                   }),
// //                             ],
// //                           ),
// //                           // SizedBox(
// //                           //   width:Provider.of<modelprovider>(context).applocal==Locale("ar") ?size : size-3,
// //                           // ),
// //                           InkWell(
// //                             child: Text(
// //                               S.of(context).forgetPassword,
// //                               style: const TextStyle(
// //                                   color: Colors.blue,
// //                                   decoration: TextDecoration.underline),
// //                             ),
// //                             onTap: () {
// //                               context
// //                                   .read<LoginCubit>()
// //                                   .formKey
// //                                   .currentState!
// //                                   .reset();
// //                               context.pushNamed(Routes.forgetPasswordSccreen);
// //                               // Navigator.pushNamed(
// //                               //     context, Forget_Password.rout);
// //                             },
// //                           ),
// //                         ],
// //                       ),
// //                       Container(
// //                         padding: EdgeInsets.only(top: 10.h),
// //                         width: double.infinity,
// //                         height: 60.h,
// //                         child: ElevatedButton(
// //                           onPressed: () async {
// //                             validateThenDoLogin(context);
// //                           },
// //                           style: ElevatedButton.styleFrom(),
// //                           child: FittedBox(
// //                             fit: BoxFit.cover,
// //                             child: circaleLoadFlag
// //                                 ? const CircularProgressIndicator(
// //                                     color: Colors.white,
// //                                   )
// //                                 : Text(
// //                                     S.of(context).login,
// //                                     style: TextStyles.font25BlueBold,
// //                                   ),
// //                           ),
// //                         ),
// //                       ),
// //                       LoginBlocListener(
// //                         rememberMe: rememberMe,
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
 
 
 
 
 
//  // drawer: Drawer(
//       //   child: ListView(
//       //     padding: EdgeInsets.zero,
//       //     children: <Widget>[
//       //       const DrawerHeader(
//       //         decoration: BoxDecoration(
//       //           color: Colors.blue,
//       //         ),
//       //         child: Text(
//       //           'Drawer Header',
//       //           style: TextStyle(
//       //             color: Colors.white,
//       //             fontSize: 24,
//       //           ),
//       //         ),
//       //       ),
//       //       ListTile(
//       //         leading: const Icon(Icons.home),
//       //         title: const Text('Home'),
//       //         onTap: () {
//       //           // Navigate to home
//       //         },
//       //       ),
//       //       ListTile(
//       //         leading: const Icon(Icons.settings),
//       //         title: const Text('Settings'),
//       //         onTap: () {
//       //           // Navigate to settings
//       //         },
//       //       ),
//       //       // Add more list tiles as needed
//       //     ],
//       //   ),
//       // ),


//         // leading: Builder(
//         //   builder: (context) => IconButton(
//         //     icon: const Icon(Icons.menu),
//         //     onPressed: () => Scaffold.of(context).openDrawer(),
//         //   ),
//         // ),