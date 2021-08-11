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
    resposta    TEXT
)
''')

#Ignorando erros de certificacao SSL (https):
ctx = ssl.create_default_context()
ctx.check_hostname = False
ctx.verify_mode = ssl.CERT_NONE

url_principal = 'https://portal.fiocruz.br/coronavirus/perguntas-e-respostas'

n = c = 0

while n < 7:
    if n <= 0:
        url_atual = url_principal

    else:
        url_atual = url_principal+'?page='+str(n)

    html_atual_feio = urlopen(url_atual, context = ctx).read()
    html_atual = BeautifulSoup(html_atual_feio, 'html.parser')

    perguntas = re.findall('/pergunta/.+>(.*\?)', str(html_atual))

    for pergunta in perguntas:
        print(pergunta)

        cur.execute('INSERT OR IGNORE INTO Perguntas_CoronaTalker (pergunta) VALUES (?)', (pergunta,))

    hrefs_respostas = re.findall('<a href="(/pergunta/.*)">', str(html_atual))

    for href_resposta in hrefs_respostas:
        url_resposta = 'https://portal.fiocruz.br'+href_resposta

        html_resposta_feio = urlopen(url_resposta, context = ctx).read()
        html_resposta = BeautifulSoup(html_resposta_feio, 'html.parser')

        resposta = re.search('content:.*<p(.*)<', str(html_resposta))[1]

        c += 1

        resposta_formatada = re.sub('<[^<]+?>|dir="ltr"', '', resposta).strip()

        print(c, resposta_formatada)
        cur.execute('INSERT INTO Respostas_CoronaTalker (resposta) VALUES (?)', (resposta_formatada,))

    n += 1

conn.commit()