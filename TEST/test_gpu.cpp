#include <iostream>
#include <ctime>
#include <cmath>
#include "bits/time.h"

#include <opencv2/core.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgproc.hpp>
#include <opencv2/imgcodecs.hpp>

#include <opencv2/core/cuda.hpp>
#include <opencv2/cudaarithm.hpp>
#include <opencv2/cudaimgproc.hpp>

#include <chrono>

#define TestCUDA true

int main() {
    std::chrono::steady_clock::time_point begin_gpu = std::chrono::steady_clock::now();
    //std::clock_t begin = std::clock();

        try {
            cv::String filename = "Intel_Classmate_PC.jpg";
            cv::Mat srcHost = cv::imread(filename, cv::IMREAD_GRAYSCALE);
            cv::Mat resultHost;
            for(int i=0; i<1000; i++) {
                if(TestCUDA) {
                    cv::cuda::GpuMat dst, src;
                    src.upload(srcHost);

                    //cv::cuda::threshold(src,dst,128.0,255.0, CV_THRESH_BINARY);
                    cv::cuda::bilateralFilter(src,dst,3,1,1);

                    dst.download(resultHost);
                    //std::cout << "test_gpu.cpp" << std::endl;
                } else {
                    cv::Mat dst;
                    cv::bilateralFilter(srcHost,dst,3,1,1);
                }
            }

            //cv::imshow("Result",resultHost);
            //cv::waitKey(1000);

        } catch(const cv::Exception& ex) {
            std::cout << "Error: " << ex.what() << std::endl;
        }

    //std::clock_t end = std::clock();
    //std::cout << double(end - begin)/CLOCKS_PER_SEC  << std::endl;
    
    std::chrono::steady_clock::time_point end_gpu = std::chrono::steady_clock::now();
    std::cout << "Time difference = " << 1000*(double) std::chrono::duration_cast<std::chrono::microseconds>(end_gpu - begin_gpu).count()/CLOCKS_PER_SEC << "[ms]" << std::endl;
}
