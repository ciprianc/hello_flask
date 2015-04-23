import unittest
from hello_flask import hello_flask_web


class CipriansTestCase(unittest.TestCase):
    def setUp(self):
        self.app = hello_flask_web.app.test_client()

    def tearDown(self):
        pass

    def test_slash(self):
        rv = self.app.get('/')
        assert 'Hello world!' in rv.data
