# docker-crafters

A small repository containing 2 directories, each containing their own Dockerfile:

## `frontend/`

This contains a tiny app written in Elm, that tries to download some text off of the internet when the application loads.

## `backend/`

This contains a tiny express app written in Typescript, that serves one endpoint returing `{"message": "Hello"}`.

## Your Mission
Is to connect both containers somehow. (using docker compose, or by running the containers in the same network, etc.).

Note that you'll have to do some small modifications to either `frontend/src/Main.elm` or `backend/src/app.ts`, or both.

GL HF!

## Hints
Building the backend docker image:

`docker build -t express-backend .`

Building the frontend docker image:

`docker build -t elm-nginx-app .`
