# require at most 3 args for the input vedio's name, output Folder, and the framerate(default as 2fps)

inputVedio='phoneVedio.mp4'
outFolder='./pic_out'
frameRate=2

if [ -z $1 ];then
    echo "predict input as ${inputVedio}, framerate as ${frameRate}, output in ${outFolder}"
else
    inputVedio=$1
    shift
    if [ ! -e ${inputVedio} ];then
        echo "no such Vedio(even just a file) named ${inputVedio}"
        exit
    fi

    if [ ! -z $1];then
        outFolder=$1
        shift
        if [ ! -d ${outFolder} ];then
            echo "no such Folder: ${outFolder}"
            exit
        fi

        if [ ! -z $1];then
            frameRate=$1
        fi
    fi
fi

ffmpeg -y -i ${inputVedio} -vf fps=${frameRate} ${outFolder}/%02d.jpg