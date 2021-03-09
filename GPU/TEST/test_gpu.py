import cv2
# import cvlib as cv
import time
import os

def main():
    print(cv2.getBuildInformation())
    print("\n\nNumber of CUDA CORES: {}.\n [WARNING] If it is detected ZERO, GPU is detected but Nvidia drivers not installed.\n [WARNING] If it is -1, GPU is not detected.\n\n".format(cv2.cuda.getCudaEnabledDeviceCount()))

    inittimer=time.time()
    img = cv2.imread('Intel_Classmate_PC.jpg')
    
    # bbox, label, conf = cv.detect_common_objects(img,confidence=0.5,model='yolov3-worker',enable_gpu=True)
    # output_image = cv.object_detection.draw_bbox(img, bbox, label, conf)

    print('The process tooks %.3f s'%(time.time()-inittimer))

    # cv2.imshow('image', output_image)
    cv2.imshow('image', img)
    
    cv2.waitKey(0)
    cv2.destroyAllWindows()

    print(os.system('nvidia-smi'))

if __name__ == "__main__":
    main()