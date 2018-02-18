import yaml
from flask import Flask

conf = dict()

# For import *
__all__ = ['create_app']


def create_app(app_name):
    """Create a Flask app."""

    app = Flask(app_name)
    __configure_app(app)
    __configure_blueprints(app)

    return app


def __configure_app(app):
    """Different ways of configurations."""
    app.config.from_object(__read_config())


def __configure_blueprints(app):
    """Configure blueprints in views."""

    from api import classifier

    for bp in [classifier]:
        app.register_blueprint(bp)


def __read_config():
    with open("properties.yaml", 'r') as stream:
        try:
            return yaml.load(stream)
        except yaml.YAMLError as exc:
            print(exc)


if __name__ == '__main__':
    app = create_app(__name__)
    app.run()
