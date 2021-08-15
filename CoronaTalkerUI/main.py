# This Python file uses the following encoding: utf-8
import sys
import os

from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QObject, Slot, Signal

class JanelaPrincipal(QObject):
    def __init__(self):
        QObject.__init__(self)

    definirNome = Signal(str)

    @Slot(str)
    def escrever_boas_vindas(self, nome):
        self.definirNome.emit('Olá, '+(nome.title())+'. Bem-vindo(a) ao CoronaTalker.')

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
