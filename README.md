## Getting Started
* Install 
    - [docker]  (https://docs.docker.com/engine/installation/)
    - [docker-compose] (https://docs.docker.com/compose/install/)
* Running the Demo
```
$ docker-compose build master                              ## the first time may take some time!
$ docker-compose run master                               
mterm> exaquery db:/tmp/demodb  
distributed create table demotbl as external 
select * 
from (
    postgres h:externaldb port:5432 u:docker p:docker db:dockdb select 5 as num, 'test' as text
);
mterm> exaresult db:/tmp/demodb demotbl;
```
* Stopping the  Demo
```
mterm> .q
root@examaster:/~exareme# exit
$ docker-compose stop
$ docker-compose rm
```
* After running the Demo in the mterm console you can use :
    - madql, [here] (http://madgik.github.io/madis/) you can find docs.
    - and along with exaquery operator (and other exa-like ops), 
      you can use exadfl, [here] (http://madgik.github.io/exareme/dfl.html) you can find docs.
