# cntlm docker container

Use the following environment variables for configuration:

- `CNTLM_PROXY` (**mandatory**): address of the upstream proxy (example: proxy.example.com:89)
- `CNTLM_NO_PROXY` (*optional*): addresses and hostnames to bypass the proxy: (default: localhost, 127.0.0.*, 10.*, 192.168.*, *.local)
- `CNTLM_USERNAME` (*optional*): username to login to the upstream proxy
- `CNTLM_DOMAIN`   (*optional*): domain to login to upstream proxy

For authentication one or multiple of the following passwords can be set:

- `CNTLM_PASSWORD` (*optional*): plain text password to login to upstream proxy
- `CNTLM_PASSNTLMV2` (*optional*): NTLMv2 password to login to upstream proxy
- `CNTLM_PASSNT` (*optional*): PassNt password to login to upstream proxy
- `CNTLM_PASSLM` (*optional*): PassLM password to login to upstream proxy

Usages examples : 

 * Simple example without authentication
   * `docker run -it --rm --name mycntlm -e CNTLM_PROXY="proxy:8100" bachp/cntlm`
 * With authentication 
   * `docker run -it --rm --name mycntlm -e CNTLM_PROXY="proxy:8100" -e CNTLM_USERNAME="me" -e CNTLM_PASSWORD="mypass" bachp/cntlm`
 * Verify and print out encrypted NTLM credentials that can be stored to a script e.g.
   * `docker run -it --rm --name mycntlm -e CNTLM_PROXY="proxy:8100" -e CNTLM_USERNAME="me" bachp/cntlm -I -M http://www.google.com`

Additonal parameters to cntlm can be passwd ass argument to the container.
