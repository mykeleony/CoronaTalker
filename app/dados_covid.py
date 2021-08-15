from urllib.request import urlopen
from bs4 import BeautifulSoup
import ssl

import re

# Ignorando erros de certificação SSL (https):
ctx = ssl.create_default_context()
ctx.check_hostname = False
ctx.verify_mode = ssl.CERT_NONE

def dados_covid_mundiais():
    # Função que retorna os números de casos e mortes pela Covid-19 no mundo.

    url_mundo = 'https://en.wikipedia.org/wiki/Template:COVID-19_pandemic_data'

    html_covid_mundial = BeautifulSoup(urlopen(url_mundo, context = ctx).read(), 'html.parser')

    mortes = re.search('<th style.*2px;">(.*)', str(html_covid_mundial))[1]
    print(mortes)

    for linha in html_covid_mundial:
        '''print(linha)
        mortes = re.search('')'''

def dados_covid_brasileiros():
    # Função que retorna os números de casos e mortes pela Covid-19 no Brasil.
    a = 10

dados_covid_mundiais()