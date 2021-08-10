import sqlite3

from urllib.request import urlopen
from bs4 import BeautifulSoup
import ssl

import re

conn = sqlite3.connect('q&a_coronavirus.sqlite')
cur = conn.cursor()

cur.executescript('''
CREATE TABLE IF NOT EXISTS Perguntas_CoronaTalker(
    id          INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
    pergunta    TEXT UNIQUE,
    id_resposta INTEGER
);

CREATE TABLE IF NOT EXISTS Respostas_CoronaTalker(
    id          INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
    resposta    TEXT UNIQUE,
    id_pergunta INT
)
''')
