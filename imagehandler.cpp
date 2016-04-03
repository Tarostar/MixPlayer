#include "imagehandler.h"
#include <QFile>

ImageHandler::ImageHandler(QObject *parent) :
    QObject(parent)
{
}

QString ImageHandler::getPathWithoutSuffix(const QString path)
{
    int pos = path.lastIndexOf(".");
    if (pos <= 0)
    {
        return path;
    }

    return path.left(pos);
}

void ImageHandler::newMusicImage(const QString path)
{
    QString imagePath = getPathWithoutSuffix(path);
    if (imagePath.isEmpty())
        return;

    /*QString imagePath = path.left(path.length() - 4);
    if (imagePath.endsWith("."))
    {
        imagePath = imagePath.left(imagePath.length()-1);
    }*/

    imagePath = findCorrespondingImage(imagePath);

    if (imagePath.length() > 0)
    {
        imagePath = "file:///" + imagePath.replace("\\", "/");
    }

    emit musicImagePath(imagePath);
}

void ImageHandler::newEffectImage(const QString path)
{
    QString imagePath = getPathWithoutSuffix(path);
    if (imagePath.isEmpty())
        return;

    /*QString imagePath = path.left(path.length() - 4);
    if (imagePath.endsWith("."))
    {
        imagePath = imagePath.left(imagePath.length()-1);
    }

    imagePath = findCorrespondingImage(imagePath);*/

    if (imagePath.length() > 0)
    {
        imagePath = "file:///" + imagePath.replace("\\", "/");
    }

    emit effectImagePath(imagePath);
}

QString ImageHandler::findCorrespondingImage(const QString imagePath)
{
    if(QFile::exists(imagePath + ".png"))
        return imagePath + ".png";

    if(QFile::exists(imagePath + ".gif"))
        return imagePath + ".gif";

    if(QFile::exists(imagePath + ".jpg"))
        return imagePath + ".jpg";

    if(QFile::exists(imagePath + ".bmp"))
        return imagePath + ".bmp";

    return "";

}
