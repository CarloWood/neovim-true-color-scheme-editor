#include "Nvr.h"
#include <QColorDialog>
#include <iostream>
#include <iomanip>
#include <sstream>

char const* NVIM_LISTEN_ADDRESS = "/tmp/nvim_listen_address";

Nvr::Nvr(std::string syntax_group) : QColorDialog(Qt::green), m_syntax_group(syntax_group)
{
  QColorDialog::setOption(QColorDialog::DontUseNativeDialog);
  QObject::connect(this, &QColorDialog::currentColorChanged, this, &Nvr::update_color);
}

void Nvr::update_color(QColor const& color)
{
  int R, G, B;
  color.getRgb(&R, &G, &B);
  std::stringstream scolor;
  scolor << '#' << std::hex << std::setfill('0') << std::setw(2) << R << std::setw(2) << G << std::setw(2) << B;
  // m_syntax_group is the first argument passed to colorpicker and should
  // be the .css file plus a color plus the line number that should be changed.
  auto colon = m_syntax_group.rfind(':');
  int line = std::stoi(m_syntax_group.substr(colon + 1));
  std::string file = m_syntax_group.substr(0, colon);
  std::ostringstream remote_command;
  remote_command << "sed -i -r -e '" << line << "s/#[0-9a-fA-F]{3,6}/" << scolor.str() << "/' " << file;
  std::cout << "Executing command \"" << remote_command.str() << "\"." << std::endl;
  int status = system(remote_command.str().c_str());
  if (!WIFEXITED(status) || WEXITSTATUS(status) != 0)
    std::cerr << "Failure to exec \"" << remote_command.str() << "\"!" << std::endl;
}
