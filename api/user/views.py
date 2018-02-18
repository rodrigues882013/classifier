from flask import Blueprint

user_bp = Blueprint('user', __name__, url_prefix='/api/v1')


@user_bp.route('/user', methods=['GET'])
def teste():
    return 'ola'
