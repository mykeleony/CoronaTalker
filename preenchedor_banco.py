import sqlite3

from urllib.request import urlopen
from bs4 import BeautifulSoup
import ssl

import re

conn = sqlite3.connect('q&a_coronavirus.sqlite')
cur = conn.cursor()

cur.executescript('''
DROP TABLE IF EXISTS Perguntas_CoronaTalker;
DROP TABLE IF EXISTS Respostas_CoronaTalker;

CREATE TABLE IF NOT EXISTS Perguntas_CoronaTalker(
    id          INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
    pergunta    TEXT UNIQUE
);

CREATE TABLE IF NOT EXISTS Respostas_CoronaTalker(
    id          INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
    resposta    TEXT UNIQUE
)
''')


#Ignorando erros de certificacao SSL (https):
ctx = ssl.create_default_context()
ctx.check_hostname = False
ctx.verify_mode = ssl.CERT_NONE

nhtml = urlopen('https://portal.fiocruz.br/coronavirus/perguntas-e-respostas', context = ctx).read()
html = BeautifulSoup(nhtml, 'html.parser')

perguntas = list()

for linha in html:
    pergunta = re.findall('/pergunta/.+>(.*\?)', str(linha))
    perguntas.append(pergunta)

for pergunta in perguntas[3]:
    cur.execute('INSERT OR IGNORE INTO Perguntas_CoronaTalker (pergunta) VALUES (?)', (pergunta,))
    cur.execute('SELECT id FROM Perguntas_CoronaTalker WHERE pergunta = ?', (pergunta,))
    id_pergunta = cur.fetchone()[0]
    print(id_pergunta, pergunta)

conn.commit()