file=$1

while read link; do

date=$(date +%s)
time=$(echo "$date * 1000" | bc)
downloadpage=$(curl -s "https://cocoleech.com/process?time=1560522219047&captcha=&link=$link" | jq -r .action | cut -d "'" -f4)

downloadlink=$(curl -s "$downloadpage" | grep "textarea" | hxselect -c textarea)

echo "$downloadlink"
sleep 70s
done < $file
