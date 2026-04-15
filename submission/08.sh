# Create a time-based CSV script that would lock funds for 6 months (using 30-day months)
# Time-based CSV uses 512-second units with the type flag (bit 22) set
# publicKey=02e3af28965693b9ce1228f9d468149b831d6a0540b25e8a9900f71372c11fb277

publicKey=02e3af28965693b9ce1228f9d468149b831d6a0540b25e8a9900f71372c11fb277

seconds=$((6 * 30 * 24 * 60 * 60))

nvalue=$(($seconds / 512))
hexvalue=$(printf '%x\n' $nvalue)
relativevalue=$(printf '%x\n' $((0x$hexvalue + 0x400000)))
timelock=$(printf '%d\n' "0x$relativevalue")
publicKeyHash=$(echo -n "$publicKey" | xxd -r -p | openssl dgst -sha256 -binary | openssl dgst -rmd160 -binary | xxd -p -c 200)
lock_push="03a77640"
lock_push="03a77640"

OP_CHECKSEQUENCEVERIFY="b2"
OP_DROP="75"
OP_DUP="76"
OP_HASH160="a9"
PUSH20="14"
OP_EQUALVERIFY="88"
OP_CHECKSIG="ac"
script="${lock_push}${OP_CHECKSEQUENCEVERIFY}${OP_DROP}${OP_DUP}${OP_HASH160}${PUSH20}${publicKeyHash}${OP_EQUALVERIFY}${OP_CHECKSIG}"
printf '%s' "$script"





