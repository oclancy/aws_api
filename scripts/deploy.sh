FILE=$(basename -- "$1")
echo $1
echo $FILE
echo $PWD

if $(aws s3 ls "s3://firmus-lambdas" 2>&1) | grep -q 'NoSuchBucket'
then
    $(aws s3 mb "s3://firmus-lambdas")
fi
if [ -f $1 ]
then
    $(aws s3 cp "$1" "s3://firmus-lambdas/${FILE}")
else
    echo "file not found"
fi