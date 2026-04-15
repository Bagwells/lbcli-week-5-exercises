# Create a CLTV script with a timestamp of 1495584032 and public key below:
# publicKey=02e3af28965693b9ce1228f9d468149b831d6a0540b25e8a9900f71372c11fb277

publicKey=02e3af28965693b9ce1228f9d468149b831d6a0540b25e8a9900f71372c11fb277
locktime=1495584032
hex=(printf '%08x\n' $locktime)
little_endian_result=$(echo $hex | sed -E 's/(..)(..)(..)(..)/\4\3\2\1/')
publicKeyHash=$(echo -n "$publicKey" | xxd -r -p | sha256sum | ripemd160 | awk '{print $1}')

OP_CHECKLOCKTIMEVERIFY=b1
OP_DROP=75
OP_DUP=76
OP_HASH160=a9
PUSH20=14
OP_EQUALVERIFY=88
OP_CHECKSIG=ac

script="04${little_endian_result}${OP_CHECKLOCKTIMEVERIFY}${OP_DROP}${OP_DUP}${PUSH20}${publicKeyHash}${OP_EQUALVERIFY}${OP_CHECKSIG}"
echo $script