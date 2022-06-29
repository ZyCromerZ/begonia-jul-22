for asu in r-oss-base-release r-oss-base-release-uv
do
    git checkout $asu && git pull . r-oss-base --signoff --no-commit || break
    git commit -sm "Merge Branch 'r-oss-base' into $asu"
    git pull . r-oss-up --signoff --no-commit || break
    git commit -sm "Merge Branch 'r-oss-up' into $asu"
    git checkout $asu-ALMK && git pull . $asu --signoff --no-ff --no-commit || break
    git commit -sm "Merge Branch '$asu' into $asu-ALMK"
    git checkout $asu-SLMK && git pull . $asu --signoff --no-ff --no-commit || break
    git commit -sm "Merge Branch '$asu' into $asu-SLMK"
    git pull . r-oss-up-SLMK --signoff --no-commit || break
    git commit -sm "Merge Branch 'r-oss-up-SLMK' into $asu-SLMK"
done

DoPush()
{
    get="${@}"
    git push --all $get -f || DoPush $get
}
DoPush origin
DoPush public