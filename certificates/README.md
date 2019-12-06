# Root CA and Signing CA

Created from https://pki-tutorial.readthedocs.io/en/latest/simple/index.html

Files taken from there

```bash
mkdir -p ca/root-ca/private ca/root-ca/db crl certs
chmod 700 ca/root-ca/private
cp /dev/null ca/root-ca/db/root-ca.db
cp /dev/null ca/root-ca/db/root-ca.db.attr
echo 01 > ca/root-ca/db/root-ca.crt.srl
echo 01 > ca/root-ca/db/root-ca.crl.srl
mkdir etc
vi etc/root-ca.conf etc
openssl req -new     -config etc/root-ca.conf     -out ca/root-ca.csr     -keyout ca/root-ca/private/root-ca.key
openssl ca -selfsign     -config etc/root-ca.conf     -in ca/root-ca.csr     -out ca/root-ca.crt     -extensions root_ca_ext

mkdir -p ca/signing-ca/private ca/signing-ca/db crl certs
vi etc/signing-ca.conf etc
chmod 700 ca/signing-ca/private
cp /dev/null ca/signing-ca/db/signing-ca.db
cp /dev/null ca/signing-ca/db/signing-ca.db.attr
echo 01 > ca/signing-ca/db/signing-ca.crt.srl
echo 01 > ca/signing-ca/db/signing-ca.crl.srl
openssl req -new     -config etc/signing-ca.conf     -out ca/signing-ca.csr     -keyout ca/signing-ca/private/signing-ca.key
openssl ca     -config etc/root-ca.conf     -in ca/signing-ca.csr     -out ca/signing-ca.crt     -extensions signing_ca_ext
```
