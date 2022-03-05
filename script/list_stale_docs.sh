set -eu

cd `dirname $0`

threshold=""

if [ "$(uname)" == "Darwin" ]; then
  threshold=$(date -v -3m +%s)
else
  threshold=$(date -d '3 month ago' +%s)
fi

cd ../

stale_files=()

git ls-tree -r --name-only HEAD ./docs | while read filename; do
  # 1646456330 README.md のような形式でデータが取得できる
  output="$(git log -1 --pretty="format:%ct" -- $filename) $filename"
  # unix timestamp形式の最終更新時間だけ取り出す
  arr=($output)
  last_edited_at=${arr[0]}
  if [ $threshold -lt $last_edited_at ]; then
      stale_files+=($filename)
  fi

  if [ ${#stale_files[@]} -gt 0 ]; then
    # persist stale file names
    echo $stale_files > ./stale_files.log
    # raise
    exit 1;
  fi
done

