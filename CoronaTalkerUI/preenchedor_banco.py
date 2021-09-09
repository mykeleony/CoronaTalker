'''
Script de preenchimento do banco de dados (q&acoronavirus.sqlite) SQLite3 sobre o novo coronavírus que contém
duas tabelas: Perguntas_CoronaTalker e Respostas_CoronaTalker. Cada tabela possui um número ID para cada elemento.
A fonte das perguntas e das respostas é o site da Fiocruz (https://portal.fiocruz.br/coronavirus/perguntas-e-respostas).
A extração dos dados é automática e não é necessário setup prévio do banco de dados.

Myke Leony dos Santos Amorim. 11 de agosto de 2021.
'''

import sqlite3

from urllib.request import urlopen
from bs4 import BeautifulSoup
import ssl

import re

def start():
    # Conectando-se (ou criando) ao banco de dados e criando suas tabelas:
    conn = sqlite3.connect('q&a_coronavirus.sqlite')
    cur = conn.cursor()

    cur.executescript('''
    DROP TABLE IF EXISTS Perguntas_CoronaTalker;
    DROP TABLE IF EXISTS Respostas_CoronaTalker;
    
    CREATE TABLE Perguntas_CoronaTalker(
        id          INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
        pergunta    TEXT UNIQUE
    );
    
    CREATE TABLE Respostas_CoronaTalker(
        id          INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
        resposta    TEXT
    )
    ''')

    # Ignorando erros de certificação SSL (https):
    ctx = ssl.create_default_context()
    ctx.check_hostname = False
    ctx.verify_mode = ssl.CERT_NONE

    # Página principal da Fiocruz. O Q&A possui 7 páginas, com 25 perguntas cada.
    url_principal = 'https://portal.fiocruz.br/coronavirus/perguntas-e-respostas'

    n_pagina = 0

    while n_pagina < 7:
        if n_pagina <= 0:
            url_atual = url_principal       # A página inicial (0) é a página principal do site.

        else:
            url_atual = url_principal+'?page='+str(n_pagina)       # As páginas seguintes possuem a sintaxe adicional '?page=n'

        html_atual_feio = urlopen(url_atual, context = ctx).read()
        html_atual = BeautifulSoup(html_atual_feio, 'html.parser') # "Limpando" o código HTML.

        # Os textos das perguntas estão posicionados após o fechamento das tags que contêm o href com "/pergunta/":
        perguntas = re.findall('/pergunta/.+>(.*\?)', str(html_atual))

        for pergunta in perguntas:
            cur.execute('INSERT OR IGNORE INTO Perguntas_CoronaTalker (pergunta) VALUES (?)', (pergunta,))

        # Os links das páginas das respostas estão no href dessas mesmas tags.
        hrefs_respostas = re.findall('<a href="(/pergunta/.*)">', str(html_atual))

        for href_resposta in hrefs_respostas:
            url_resposta = 'https://portal.fiocruz.br'+href_resposta

            html_resposta_feio = urlopen(url_resposta, context = ctx).read()
            html_resposta = BeautifulSoup(html_resposta_feio, 'html.parser')

            # Os textos das respostas estão contidos na tag <p> das linhas que apresentam o elemento content:(...)
            resposta = re.search('content:.*<p(.*)<', str(html_resposta))[1]

            # Retirando eventuais comandos HTML contidos na resposta extraída e retirando os espaços laterais do texto.
            resposta_formatada = re.sub('<[^<]+?>|dir="ltr"|>', '', resposta).strip()

            cur.execute('INSERT INTO Respostas_CoronaTalker (resposta) VALUES (?)', (resposta_formatada,))

        n_pagina += 1

    # Atualizando o banco de dados:
    conn.commit()

    cur.close()

if __name__ == '__main__':
    start()