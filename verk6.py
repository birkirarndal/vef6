from sys import argv

import bottle
from bottle import *
from beaker.middleware import SessionMiddleware
import os


session_opts ={
    'session.type': 'file',
    'session.data_dir': './data',
    'session.cookie_expires': 300,
    'session.auto': True
}

app = SessionMiddleware(app(), session_opts)

vara = [{'name': 'Jakki', 'price': '25000'},
        {'name': 'Peysa', 'price': '15000'},
        {'name': 'Kjóll', 'price': '30000'},
        {'name': 'Nærbuxur', 'price': '5000'},
        {'name': 'Samfestingur', 'price': '30000'},
        {'name': 'Jakkaföt', 'price': '40000'}]

# templates
@route("/")
def index():
    return template('index.tpl')

@route("/chart/<id>")
def add(id):
    bs = request.environ.get('beaker.session')
    bs[id] = 'check'
    bs.save()
    redirect('/')
@route('/chart')
def chart():
    bs = request.environ.get('beaker.session')
    return template('chart', val=vara)

@route("/del/<id>")
def eyda(id):
    bs = request.environ.get('beaker.session')
    bs[id] = None
    redirect('/chart')

@route("/delall")
def eyda():
    bs = request.environ.get('beaker.session')
    bs.delete()
    bs.save()
    redirect("/chart")

@route("/static/<skra>")
def static_skrar(skra):
    return static_file(skra, root='./static')

######################################################
@error(404)
def villa(error):
    return "<h2 style='color:red'>Þessi síða finnst ekki</h2>"

#run(app=app,host='localhost', port=8080, reloader=True, debug=True)

bottle.run(host='0.0.0.0', port=argv[1], end=end)