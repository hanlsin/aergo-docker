sh ./clean.sh

password=1234
new_password=1234
AERGOCLI="$AERGO_BIN_PATH/aergocli"
AERGOSVR="$AERGO_BIN_PATH/aergosvr"

# create account
echo '======== Create account =========='
wallet=`$AERGOCLI account new --password $password | tail -1`
echo "Address: ${wallet}"

# export account
echo '======== Export account =========='
wif=`$AERGOCLI account export --address ${wallet} --password $password | tail -1`
echo "WIF: ${wif}"

# create genesis.json
# 1234 WIF: 47DTHPaRpbJ67KZvBaciz68EJ5k6E2FNBUuknKR6NA4t8oyA3uyvjS2QKxJ7JsgHMunPUitoT
# 1234 WIF: 47tUg8EcdQHMTQxRDvCpbLyrCqDgvNRbsCL8D2ofGtba37exfv6gvdagzdUVo1tAwKtB7RPSq
# 1234 WIF: 47J8GTebux2mzv1c3LxgC34Qc1TzTkhuykhruqFkSwH6Rb1iDefVQxEs5jVQtpp14rKwc4SyL
# 1234 WIF: 47mBMRiXdYUB4aRjqCBf4Pbj8byDUoVLN2qXsBWPoyf3B2A7q6b5Gsxzp7rsFra1TFzwHaiEP
# 1234 WIF: 47Boy8KXvRLzcaJhs9VcUKoCT7fZ78oabM9u1QeY6tANHXVpTeDvTsAfgFMhY6YHebZMPG6is
echo '======== Create genesis.json =========='
echo '
{
	"chain_id": {
		"magic": "yp.personal",
		"public": false,
		"mainnet": false,
		"consensus":"sbp"
	},
	"timestamp": 1530838888,
	"balance": {
		"AmLhdG4mk5GhVrQP5jNFdfEFwNC7qpRErDrFT7iGwp2a82GRtPBi": "100000000000000000000000000",
		"AmMqWScQQZ3FYqP6KkREzaFJbxj3Ne7qqK13ymoZn2GYvHWie6yP": "100000000000000000000000000",
		"AmPcRanjQTjQhRpoE4iipKpqbeZoy1Ea2oi1rHT32rN1TwJ3SDG7": "100000000000000000000000000",
		"AmPcNa8HhQBo4nKiWjq4A9ACckYef4oKGUkVgi89Ft9eCuBUPGMy": "100000000000000000000000000",
		"AmNW9YMMm48jTxX5Yee6tRYLpuptWdg3cqbD2CVoee1YcUGBHfad": "100000000000000000000000000"
	},
	"bps": [
	]
}' > genesis.json
cat genesis.json

# init genesis block
echo '======== Initialize genesis block =========='
$AERGOSVR init --genesis genesis.json --home `pwd`

