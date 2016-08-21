# DataStax Docker

> **Note:** Not meant for production use. See [this whitepaper on DataStax.com][whitepaper]
> for details on setting up DSE and Docker in production.

## Docker Compose for running DataStax Enterprise and DataStax Studio
There is a sample docker-compose file which starts a DataStax Enterprise container together with a container with DataStax Studio. 

Before starting it with the command below, both the images for [DataStax Enterprise][dse] and [DataStax Studio][studio] have to be build and available locally. This is necessary as because of containing software from DataStax, it can not be uploaded to Docker Hub. 

		$ docker-compose up -d

[whitepaper]: http://www.datastax.com/wp-content/uploads/resources/DataStax-WP-Best_Practices_Running_DSE_Within_Docker.pdf
[dse]: https://github.com/TrivadisBDS/dockerfiles/tree/master/datastax/dse
[studio]: https://github.com/TrivadisBDS/dockerfiles/tree/master/datastax/dse-studio
