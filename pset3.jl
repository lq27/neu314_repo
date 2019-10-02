# Livia Qoshe
# Pset 3

cd("/Users/livia/Documents/0 fall 2019/NEU314/neu314_repo");
using Images
using PyPlot
pygui(true);

image = imread("el-capitan.png");
imshow(image);

print("size of image: ", size(image));

"""
extractRGB() -- Reads and displays an image. Returns individual RGB matrices.
extractRGB() reads in a file, named "filename" in the working directory, using
    imread(). (Images package must be installed. Must run "using Images".)
    Also displays the image using imshow(). Finally, the red, green, and blue
    channels are extracted from the 4d matrix of values corresponding to the
    image file. Red is assumed to be the 1st value of the 3rd dimension, green
    the 2nd, and blue the 3rd.
    
Args:
   filename (string): Name of image file.

Returns:
   red (Array{Float32,2}): 2D  matrix of red values corresponding to each
                           row/col pair
   green (Array{Float32,2}): 2D  matrix of green values corresponding to each
                           row/col pair
   blue (Array{Float32,2}): 2D  matrix of blue values corresponding to each
                           row/col pair
"""
function extractRGB(imagefile)

    imagename = imread(imagefile);
    imshow(imagename);

    red = imagename[:, :, 1];
    green = imagename[:, :, 2];
    blue = imagename[:, :, 3];

    return red, green, blue
end

red = extractRGB("el-capitan.png")[1];
green = extractRGB("el-capitan.png")[2];
blue = extractRGB("el-capitan.png")[3];
