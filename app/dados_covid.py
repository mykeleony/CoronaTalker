from urllib.request import urlopen
from bs4 import BeautifulSoup
import ssl

import re

# Ignorando erros de certificação SSL (https):
ctx = ssl.create_default_context()
ctx.check_hostname = False
ctx.verify_mode = ssl.CERT_NONE

def buscar_dados_covid():
    # Função que retorna os números de casos e mortes pela Covid-19 no mundo.

    url_dados = 'https://en.wikipedia.org/wiki/Template:COVID-19_pandemic_data'

    html_dados = BeautifulSoup(urlopen(url_dados, context = ctx).read(), 'html.parser')

    numeros_mundo = re.findall('<th style.*2px;">(.*)', str(html_dados))
    
    casos_mundo = numeros_mundo[0]
    mortes_mundo = numeros_mundo[1]

    numeros_brasil = re.findall('<td>(.*)', str(html_dados))

    casos_brasil = numeros_brasil[7]
    mortes_brasil = numeros_brasil[8]
    
    dados_covid = list()
    dados_covid.extend((casos_mundo, mortes_mundo, casos_brasil, mortes_brasil))
    
    return dados_covid

if __name__ == '__main__':
    buscar_dados_covid()