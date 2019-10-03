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

println("Reset with git reset --mixed");

image2 = copy(image);
image2[:,:,1] = green;
image2[:,:,2] = blue;
image2[:,:,3] = red;

subplot(1,2,1)
imshow(image);
axis("off")
title("El Capitan: Original")

subplot(1,2,2)
imshow(image2);
axis("off")
title("El Capitan: GBR shifted")


# Part B

"""
circularRotation() -- Pixel shifts (rotates) a color channel in imagefile
circularRotation(): Shifts the pixels of a specified color channel (red, green,
    or blue) in the image specified by imagefile, up by the numRotations
    specified. 

Args:
   imagefile (string): Name of image file. (must be in current wd)
   numRotations (int): number of pixels to rotate up
   channel (string): which color channel to rotate up? (must be red, green, or blue)

Returns:
   newimage Array{Float32,3}: the newly rotated image. Has the same dimensions
            as the image corresponding to imagefile.
"""
function circularRotation(imagefile, numRotations, channel)

    imagename = imread(imagefile);
    newimage = imread(imagefile);

    if channel == "red"
        dimension3 = 1;
    end

    if channel == "green"
        dimension3 = 1;
    end

    if channel == "blue"
        dimension3 = 1;
    end

    numrows = size(imagename)[1]
    println(numrows)
    # for each row, shift it down by numRotations
    for i = 1: numrows
        shiftRow = (i+numRotations) % numrows;

        # special case for shifting last row, since no 0th row
        if shiftRow == 0
            shiftRow = numrows;
        end
        newimage[i, :, dimension3] = imagename[shiftRow, :, dimension3]
    end

    return newimage
end

rotated = circularRotation("el-capitan.png",180, "red");

clf();

subplot(1,2,1)
imshow(image);
axis("off")
title("El Capitan: Original")

subplot(1,2,2)
imshow(rotated);
axis("off")
title("El Capitan: Red shift up 180p")
