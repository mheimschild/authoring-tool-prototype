#!/bin/bash

PORT=3002 MONGO_URL=mongodb://localhost:27017/authoring nohup meteor -p 3002 &
