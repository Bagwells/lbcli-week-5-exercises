# Create a CSV script that would lock funds until one hundred and fifty blocks had passed

publicKey=02e3af28965693b9ce1228f9d468149b831d6a0540b25e8a9900f71372c11fb277
blocks=150
hexblocks=$(printf '%x' "$blocks")
lock_push="020096"
OP_CHECKSEQUENCEVERIFY="b2"
OP_DROP="75"
push33="21"
OP_CHECKSIG="ac"
script="${lock_push}${OP_CHECKSEQUENCEVERIFY}${OP_DROP}${push33}${publicKey}${OP_CHECKSIG}"

echo $script

