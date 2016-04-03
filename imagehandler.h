#ifndef IMAGEHANDLER_H
#define IMAGEHANDLER_H

#include <QObject>

class ImageHandler : public QObject
{
    Q_OBJECT
public:
    explicit ImageHandler(QObject *parent = 0);

private:
    QString findCorrespondingImage(const QString imagePath);
    QString getPathWithoutSuffix(const QString path);

signals:
    void musicImagePath(const QString path);
    void effectImagePath(const QString path);

public slots:
    void newMusicImage(const QString path);
    void newEffectImage(const QString path);

};

#endif // IMAGEHANDLER_H
