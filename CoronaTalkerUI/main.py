# This Python file uses the following encoding: utf-8
import sys
import os

from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QObject, Slot, Signal

import dados_covid

class JanelaPrincipal(QObject):
    def __init__(self):
        QObject.__init__(self)

    # Manipulador para levar a função de escrita de boas vindas à interface gráfica.
    definirNome = Signal(str)

    @Slot(str)
    def escrever_boas_vindas(self, nome):
        # Exibe uma mensagem personalizada na página inicial.
        self.definirNome.emit('Olá, ' + (nome.title()) + '. Bem-vindo(a) ao CoronaTalker.')

    mostrarContaminadosCovidMundial = Signal(str)

    @Slot (str)
    def trazer_contaminados_covid_mundial(self, indice):
        num_contaminados_mundo = dados_covid.buscar_dados_covid(0)
        self.mostrarContaminadosCovidMundial.emit(num_contaminados_mundo)

    mostrarMortesCovidMundial = Signal(str)

    @Slot(str)
    def trazer_mortes_covid_mundial(self, indice):
        num_mortes_mundo = dados_covid.buscar_dados_covid(1)
        self.mostrarMortesCovidMundial.emit(num_mortes_mundo)

    mostrarContaminadosCovidBrasil = Signal(str)

    @Slot(str)
    def trazer_contaminados_covid_brasil(self, indice):
        num_contaminados_brasil = dados_covid.buscar_dados_covid(2)
        self.mostrarContaminadosCovidBrasil.emit(num_contaminados_brasil)

    mostrarMortesCovidBrasil = Signal(str)

    @Slot(str)
    def trazer_mortes_covid_brasil(self, indice):
        num_mortes_brasil = dados_covid.buscar_dados_covid(3)
        self.mostrarMortesCovidBrasil.emit(num_mortes_brasil)

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    # Conectando-se à interface gráfica:
    main = JanelaPrincipal()
    engine.rootContext().setContextProperty('backend', main)

    # Carregando o arquivo QML principal:
    engine.load(os.path.join(os.path.dirname(__file__), "qml/main.qml"))

    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
