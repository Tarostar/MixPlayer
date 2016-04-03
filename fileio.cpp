#include "fileio.h"
#include <QFile>
#include <QDir>
#include <QTextStream>

FileIO::FileIO(QObject *parent) :
    QObject(parent)
{

}

QString FileIO::read()
{
    if (mSource.isEmpty()){
        emit error("source is empty");
        return QString();
    }

    QFile file(mSource);
    QString fileContent;
    if ( file.open(QIODevice::ReadOnly) ) {
        QTextStream t( &file );
        fileContent = t.readAll();

        file.close();
    } else {
        emit error(mSource);
        return QString();
    }
    return fileContent;
}

bool FileIO::write(const QString& data)
{
    if (mSource.isEmpty())
        return false;

    QFile file(mSource);
    if (!file.open(QFile::WriteOnly | QFile::Truncate))
    {
        QDir dir;

        // get path
        int pos = mSource.lastIndexOf("/");
        if (pos <= 0)
        {
            return false;
        }

        // attempt to create path
        QString path = mSource.left(pos);
        if (!dir.mkpath(path))
        {
            return false;
        }

        // try again
        if (!file.open(QFile::WriteOnly | QFile::Truncate))
        {
            return false;
        }
    }

    QTextStream out(&file);
    out << data;

    file.close();

    return true;
}
