# TestKingfisherImageCache1026

### General

A demo project for fixing the memory-alloc related error `mach_vm_map(size=147456) failed (error code=3)`

The related issue is: https://github.com/onevcat/Kingfisher/issues/538

The image files(considered as .png) are removed from the project so as to make it small.
Add as many image files(.png) as you want to test this project.

### Setup

1. Clone or download project.
1. Go to the root of the project directory and run `pod install` .
1. Open the project by Xcode 10.
1. In Xcode, add image files(.png) into the project bundle.
1. Hit 'Run' button to run the project to see if it gets the memory-alloc related error(as shown in the beginning of Readme).
1. Or you can run it in the Instrument to check the memory allocation.
