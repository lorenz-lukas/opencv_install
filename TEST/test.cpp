//#include <opencv2/imgproc.hpp>
#include <opencv2/core.hpp>
#include <opencv2/imgcodecs.hpp>
#include <opencv2/highgui.hpp>
#include <iostream>
#include <string>

using namespace cv;
using namespace std;

int main( int argc, char** argv )
{
    String imageName( "Intel_Classmate_PC.jpg" ); // by default
    if( argc > 1)
    {
        imageName = argv[1];
    }

    Mat image;
    image = imread( imageName, IMREAD_COLOR ); // Read the file
    
    if( image.empty() )                      // Check for invalid input
    {
        cout <<  "Could not open or find the image" << std::endl ;
        return -1;
    }
    //namedWindow( "Display window", WINDOW_AUTOSIZE ); // Create a window for display.
    
    imshow( "Display window", image );                // Show our image inside it.
    int k = waitKey(0); // Wait for a keystroke in the window
    // cout << image << endl;
    
    return 0;
}
