AERGOCLI=${AERGO_BIN_PATH}/aergocli
AERGOSVR=${AERGO_BIN_PATH}/aergosvr

DEFAULT_DIR=$(echo $PWD | sed 's_/_\\/_g')
echo $DEFAULT_DIR
sed -e "s/DEFAULT_DIR/${DEFAULT_DIR}/g" config.toml.template > config.toml
#cat config.toml
$AERGOSVR --home `pwd` --config config.toml
