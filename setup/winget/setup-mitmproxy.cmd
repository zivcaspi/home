REM mitmproxy is a proxy similar to Fiddler
winget install mitmproxy.mitmproxy

REM To run MITM in proxy/tunnel mode (just a proxy, without cracking open a TLS tunnel)
REM use mitmdump, not mitmproxy
REM
REM mitmdump  --listen-host 127.0.0.1 --listen-port 8888 --ignore-hosts '.*'
