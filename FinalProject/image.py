import sys
import random
import argparse
import numpy
import math

from PIL import Image

grey1 = "$@B%8&WM#*oahkbdpqwmZO0QLCJUYXzcvunxrjft/\|()1{}[]?-_+~<>i!lI;:,\"^`'. "
grey2 = '@%#*+=-:. '

def calcAverage(image):

    pic = numpy.array(image)
    width,hight = pic.shape
    return numpy.average(pic.reshape(width*hight))

def asciify(file, column, scale, greyLevel):
    global grey1, grey2
    image = Image.open(file).convert('L')
    W, H = image.size[0], image.size[1]
    print("Image Dimensions: %d x %d" % (W, H))

    width = W/column
    hight = width/scale
    rows = int(H/hight)
    
    print("Number of colums: %d, Number of rows: %d" % (column, rows))


    if column > W or rows > H:
        print("Image too small")
        exit(0)


    imageString = []

    for i in range(rows):
        dimY = int(i*hight)
        dimY2 = int((i+1)*hight)

        if i == rows-1:
            dimY2 = H

        imageString.append("")
        for j in range(column):

            dimX = int(j*width)
            dimX2 = int((j+1)*width)

            if j == column-1:
                dimX2 = W

            img = image.crop((dimX, dimY, dimX2, dimY2))

            avg = int(calcAverage(img))

            if greyLevel:
                greyValue = grey1[int((avg*69)/255)]
            else:
                greyValue = grey2[int((avg*9)/255)]

            imageString[i] += greyValue
    
    return imageString

def main():

    welcomeString = "Welcome to asciify.py"
    flagReader = argparse.ArgumentParser(description=welcomeString)

    flagReader.add_argument('-f', dest='inFile', required=True)
    flagReader.add_argument('--out', dest='outFile', required=False)
    flagReader.add_argument('--greyLevel',dest='greyLevel',action='store_true')

    argReader = flagReader.parse_args()
  
    inFile = argReader.inFile

    outFile = 'asciiImage.txt'
    if argReader.outFile:
        outFile = argReader.outFile

    scale = 0.40

    column = 80

    imageString = asciify(inFile, column, scale, argReader.greyLevel)

    f = open(outFile, 'w')

    for row in imageString:
        f.write(row + '\n')

    f.close()
    print("Image written as: %s" % outFile)

if __name__ == '__main__':
    main()