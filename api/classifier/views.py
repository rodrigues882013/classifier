import base64
import requests
from flask import request, jsonify, current_app, Blueprint

classifier_bp = Blueprint('classifier', __name__, url_prefix='/api/v1')


@classifier_bp.route('/classify', methods=['POST'])
def classifier():
    url_object = request.get_json()
    url = __config_url(url_object.get('url'))

    return jsonify(requests.get(url=url, headers=__config_header()).json())


def __config_url(url):
    return "{0}/{1}".format(current_app.config['SERVICE']['URL'], __encode_str(url))


def __encode_str(_str):
    return base64.b64encode(_str.encode()).decode()


def __config_header():
    return dict(Authorization='Basic {0}'.format(__encode_str(current_app.config['SERVICE']['KEY'])))

