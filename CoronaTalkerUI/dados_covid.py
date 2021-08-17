'''
Script que realiza Web Scraping e fornece os números de casos e mortes por Covid-19 no Brasil e no mundo.

Myke Leony dos Santos Amorim. 15 de agosto de 2021.
'''

from urllib.request import urlopen
from bs4 import BeautifulSoup
import ssl

import re

# Ignorando erros de certificação SSL (https):
ctx = ssl.create_default_context()
ctx.check_hostname = False
ctx.verify_mode = ssl.CERT_NONE

def buscar_dados_covid(indice):
    # Função que retorna os números de casos e mortes pela Covid-19 no mundo.

    # As informações serão retiradas do site da Wikipédia:
    url_dados = 'https://en.wikipedia.org/wiki/Template:COVID-19_pandemic_data'

    # Acessando a página de estatísticas da Covid-19 e "limpando" o código HTML.
    html_dados = BeautifulSoup(urlopen(url_dados, context = ctx).read(), 'html.parser')

    # Os números de casos e mortes no mundo estão contidos nas duas primeiras tags <th>:
    numeros_mundo = re.findall('<th style.*2px;">(.*)', str(html_dados))
    
    casos_mundo = numeros_mundo[0]
    mortes_mundo = numeros_mundo[1]

    # Os números de casos e mortes no Brail estão contidos, respectivamente, na sétima e na oitava tag <td>:
    numeros_brasil = re.findall('<td>(.*)', str(html_dados))

    casos_brasil = numeros_brasil[7]
    mortes_brasil = numeros_brasil[8]

    # Agrupando as quatro informações em uma lista:
    dados_covid = list()
    dados_covid.extend((casos_mundo, mortes_mundo, casos_brasil, mortes_brasil))

    return dados_covid[indice]

if __name__ == '__main__':
    print(buscar_dados_covid(0))