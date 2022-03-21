# Asennusohjeet

Aja ympäristö pystyyn `docker-compose up -d`.

Saadaksesi Gruntin toimimaan, niin avaa ensin Docker-ympäristö shelliin
`docker exec -it moodle bash` ja tämän jälkeen suorita seuraavat vaiheet

- `mkdir node_modules`
- `chmod 777 node_modules`
- `npm install`
- `npm install -g grunt-cli`

Tämän jälkeen pitäisi Gruntin toimia, ellei Linuxin file permissiot ole päin seiniä.