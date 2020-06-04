#!/usr/bin/env python3

from aiohttp import web
import views

def setup(app):
    app.add_routes([ web.get("/users/{user}/keys", views.get_keys)])
