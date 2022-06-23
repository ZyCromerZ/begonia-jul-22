for asu in q-oss-base-release q-oss-base-release-uv
do
    git checkout $asu && git pull . new-q-oss-up --signoff --no-commit || break
    git commit -sm "Merge Branch 'new-q-oss-up' into $asu"
    git pull . q-oss-base --signoff --no-commit || break
    git commit -sm "Merge Branch 'q-oss-base' into $asu"
    git checkout $asu-ALMK && git pull . $asu --signoff --no-ff --no-commit || break
    git commit -sm "Merge Branch '$asu' into $asu-ALMK"
    git checkout $asu-SLMK && git pull . $asu --signoff --no-ff --no-commit || break
    git commit -sm "Merge Branch '$asu' into $asu-SLMK"
    git pull . new-q-oss-up-SLMK --signoff || break
    git commit -sm "Merge Branch 'new-q-oss-up-SLMK' into $asu-SLMK"
done

DoUpNow()
{
    git push --all origin -f || DoUpNow
}
DoUpNow