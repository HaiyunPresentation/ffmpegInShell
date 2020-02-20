# require at most 4 args for the framerate, img-folder, the img-format, and outVedio's name(default as out.avi)

frameRate=2
imgFolder='./pic'
imgFormat='%02d.jpg'
outVedio='out.avi'

if [ ! -z $1 ];then
    frameRate=$1
    shift
fi

if [ -z $1 ];then
    echo 'predict the imgs in "./pic/", format as "01.jpg", output as "out.avi"'
    
else
    imgFolder=$1
    shift
    if [ ! -d ${imgFolder} ];then
        echo "no such Folder exsit: ${imgFolder}"
        exit
    fi

    if [-z $1 ];then
        echo 'predict output as "out.avi"'
    else
        imgFormat=$1
        shift

        if [ ! -z $1 ];then
            outVedio=$1
        fi
    fi
fi

ffmpeg -y -framerate 2 -i ${imgFolder}/${imgFormat} ${outVedio}