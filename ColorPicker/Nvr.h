#include <QColorDialog>
#include <string>

class Nvr : public QColorDialog
{
  Q_OBJECT

 private:
  std::string m_syntax_group;

 public:
  Nvr(std::string syntax_group);

  // The syntax group to update.
  void set_syntax_group(std::string syntax_group) { m_syntax_group = syntax_group; }

 public slots:
  void update_color(QColor const& color);
};
