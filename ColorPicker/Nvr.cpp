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
  std::string remote_command = ":hi " + m_syntax_group;
  if (m_syntax_group.find("Error") != std::string::npos || m_syntax_group == "Search" || m_syntax_group == "Underlined")
    remote_command += " guibg=";
  else
    remote_command += " guifg=";
  remote_command += scolor.str() + "<CR>";
  std::string command = "nvr --nostart --servername \"";
  command += NVIM_LISTEN_ADDRESS;
  command += "\" --remote-send \"";
  command += remote_command;
  command += "\"";
  std::cout << "Executing command \"" << remote_command << "\"." << std::endl;
  int status = system(command.c_str());
  if (!WIFEXITED(status) || WEXITSTATUS(status) != 0)
    std::cerr << "Failure to send \"" << command << "\" to nvim!" << std::endl;
}
