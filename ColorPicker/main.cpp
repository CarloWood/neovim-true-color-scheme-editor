#include <QApplication>
#include <QColorDialog>
#include "Nvr.h"
#include <iostream>

int main(int argc, char* argv[])
{
  QApplication app(argc, argv);
  QGuiApplication::setApplicationDisplayName("neovim syntax highlight color picker");

  QStringList args = QCoreApplication::arguments();
  if (args.count() != 2)
  {
    std::cerr << "Usage: " << args.at(0).toUtf8().constData() << " <file>.css:<line>" << std::endl;
    return 1;
  }

  Nvr nvr(args.at(1).toStdString());
  nvr.show();

  return app.exec();
}
