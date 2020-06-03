from aiohttp import web
import asyncio
import json
import logging


async def get_keys(request):
    try:
        with open("/home/ubuntu/keyfile.gh") as f:
            txt = f.read()
        username = request.match_info['user']
        j_data = json.loads(txt)
        for user in j_data:
            you = user.keys() 
            for us in you:
                if us == username:
                    response = user[username]
                    return web.HTTPCreated(body=json.dumps(response), content_type="application/json")
        return web.Response(text="The user you requested does not exist in the local mirror")
    except FileNotFoundError as err:
        return web.Response(text=err)

