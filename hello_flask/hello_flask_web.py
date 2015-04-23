from flask import Flask
import logging

app = Flask(__name__)
app.debug = True

stream_handler = logging.StreamHandler()
app.logger.addHandler(stream_handler)
app.logger.setLevel(logging.INFO)


@app.route('/')
def root_url():
    """ Just return hello world  """
    return 'Hello world!'


if __name__ == '__main__':
    app.run(debug=True, port=8080)  # pragma: no cover
