# Project cAR - Flutter and iOS ARKit implementation
This is the submission for Project cAR, a project developed for the CP317 class at Wilfrid Laurier University. This submission deals with the iOS component of the application, and links to the cross-platform app that manages user features and car details, built using Flutter. 

The Flutter component of the app is available in the root/c_ar directory of this codebase and is built separately. Please pull this code and build it with the Flutter SDK.
More information on the app can be found [here](https://github.com/lovette14/cAR-project).

## AR Features
1. Coaching feature to help user track their nearest plane surface.
2. Plane surface detection using Raycasting from ARKit.
3. Reset surface detection and track planes again
4. Selection of Cars (and motorcycles!) from a UITable (click the + icon!)
5. Record videos and captures photos of ARView and export to gallery

## AR APIs/Frameworks used
1. [ARVideoKit](https://github.com/AFathi/ARVideoKit)
2. [Placing Objects and Handling 3D Interaction](https://developer.apple.com/documentation/arkit/environmental_analysis/placing_objects_and_handling_3d_interaction)
