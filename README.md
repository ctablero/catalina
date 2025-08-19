# Catalina

A Github action that automates tests of Knex.js migrations and rollbacks in the Continuous Integration of your Github project.

## The problem

Services often require applying changes to databases using Knex.js migrations as part of deployment pipelines.

There can be situations where these migrations and/or rollback fail when applied to real environments(qa, uat, staging, prod). This abruptly blocks the chain of CI/CD of the service.

## The solution

An automation to test database changes definitions based on Knex migration scripts.

It consolidates next stages:

1. Create an ephimeral Database using docker
2. Read and execute knex.js migrations defined in your github project repository against the ephimeral Database
3. Read and execute knex.js rollback defined in your github project repository against the ephimeral Database

A failure during stages 2 and 3 will make the complete action fails, in other words something is wrong with code changes relative to migrations scripts and require revision.

Use it within a Github Action CI(Continuous delivery) job of your repository project. This will permit your team detect potential issues in knex.js migrations / rollback and the opportunity to fix before real deployments.

## Setup instructions

Define a step within a Github Action Job that use this action. Ensure to also checkout the workflow's repository into the runner's workspace, this will provide Knex.js scripts to the action.

### Parameters

- rdbms (required): The Relational Database management to use to create the ephimeral database. Currently support for mysql, mssql, postgres
- db-image-name (required): The name of the docker image to use to deploy the ephimeral database according to the supported rdbms
- db-image-tag (required): The tag of the docker image to use to deploy the ephimeral database according to the supported rdbms

### Versions of the action

This action follows next guidelines to manage versions: https://docs.github.com/en/actions/how-tos/create-and-publish-actions/manage-custom-actions#using-release-management-for-actions

You can use tags, branches or commits to define what version to use. Review availability of versions in this repository to determine what is the best one you require for your CI pipelines.

### Example of usage

```yaml
on:
  push:

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout
      uses: actions/checkout@v4

    - id: test_migrations
      name: Test database migrations
      uses: ctablero/catalina@v1
      with:
        db-image-name: mysql
        db-image-tag: latest
        rdbms: mysql

```

## Docker resources used in this action

### Knex

We are building a simple knex docker image on top of node alpine. The image is defined in knex/Dockerfile for installing dependencies, copying required files and execute the migration, simple as that.

You can build the knex image from the Dockerfile locally for testing purposes:

<pre>
docker build --build-arg DB_CLIENT=db-client -t knex:my-tag . 
</pre>

Where DB_CLIENT can be any client recommended in the knex documentation, eg. mysql2, pg, etc

Then you can run a container based on the knex image locally for testing purposes:

<pre>
docker container run --name knex_migration_tool --network=database_network --env-file=.env --rm knex:latest
</pre>

### RDBMS

The action will read what docker image:tag to use and will pull  pull it.

## Development tools

- Test actions locally: https://github.com/nektos/act
