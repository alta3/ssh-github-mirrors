#!/usr/bin/env python3

# The goal of this script is to create a local mirror of the returned values from looking up github user's keys, and serve them as the json get's returned.


import os
import logging
import argparse
import asyncio
from aiohttp import web
import routes

dir_path = os.path.dirname(os.path.realpath(__file__))

logging.basicConfig(
    filename=f"{dir_path}/log/ssh-github-mirror.log",
    level=logging.DEBUG,
    format="%(asctime)s %(levelname)-8s %(message)s",
    datefmt="%Y-%m-%d %H:%M:%S",
)

if __name__ == "__main__":
    logging.info("Starting up the server")
    app = web.Application()
    routes.setup(app)
    web.run_app(app, port=12345)

    # That's the stupidest port I've ever heard in my life!
    # That's the kinda thing an idiot would have on his luggage



