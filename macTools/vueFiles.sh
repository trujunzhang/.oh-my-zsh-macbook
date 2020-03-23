currentFold=$PWD

echo ""
printf "current fold=%s\n" "${currentFold}"
echo ""

function makeFile {
    filename=$1
    dest="${currentFold}/${filename}"
    if [ ! -f "${dest}" ]
    then
        touch "${dest}"
        echo "exist[no]. ${dest}"
    else
        echo "exist. ${dest}"
    fi
}

yourfilenames=`ls *.vue`
for eachfile in $yourfilenames
do
    filename="${eachfile%.*}"
    jsFile="${filename}.js"
    scssFile="${filename}.scss"

    echo ""
    # Step1: js File.
    makeFile "${jsFile}"
    # Step2: scss File.
    makeFile "${scssFile}"
    echo ""

    # printf "file=%s\n" "${filename}"
done