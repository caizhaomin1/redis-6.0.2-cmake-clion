#!/bin/bash

echo "yes" | ../redis-cli --cluster create 127.0.0.1:8000 127.0.0.1:8001 127.0.0.1:8002
