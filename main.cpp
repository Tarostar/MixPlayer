#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlEngine>
#include <QtQml>
#include <QStandardPaths>
#include <QQmlContext>
#include <QIcon>
#include "imagehandler.h"
#include "fileio.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    app.setOrganizationName("Radical Approach");
    app.setOrganizationDomain("http://www.radicalapproach.co.uk/");
    app.setApplicationName("Mix Player");

    app.setWindowIcon(QIcon("mixplayer.png"));

    QQmlApplicationEngine engine;

    // get app path and expose it to QML
    QUrl appPath(QString("%1").arg(app.applicationDirPath()));
    engine.rootContext()->setContextProperty("appPath", appPath);

    QUrl appDataPath;
    const QStringList appDataLocation = QStandardPaths::standardLocations(QStandardPaths::AppDataLocation);
    if (appDataLocation.isEmpty())
        appDataPath = appPath;
    else
        appDataPath = QString("%1").arg(appDataLocation.first());
    engine.rootContext()->setContextProperty("appDataPath", appDataPath);

    // Get the QStandardPaths locations and expose them to QML (if not found use app path)
    QUrl userPath;
    const QStringList usersLocation = QStandardPaths::standardLocations(QStandardPaths::HomeLocation);
    if (usersLocation.isEmpty())
        userPath = appPath;
    else
        userPath = QString("%1").arg(usersLocation.first());
    engine.rootContext()->setContextProperty("userPath", userPath);

    QUrl imagePath;
    const QStringList picturesLocation = QStandardPaths::standardLocations(QStandardPaths::PicturesLocation);
    if (picturesLocation.isEmpty())
        imagePath = appPath;
    else
        imagePath = QString("%1").arg(picturesLocation.first());
    engine.rootContext()->setContextProperty("imagePath", imagePath);

    QUrl musicPath;
    const QStringList musicLocation = QStandardPaths::standardLocations(QStandardPaths::MusicLocation);
    if (musicLocation.isEmpty())
        musicPath = appPath;
    else
    {
        // android music path always uses storage for some reason, but never works, so change to mnt which works
        // same for sdcard0 which should be sdcard
        QString firstMusicLoc = musicLocation.first();
        firstMusicLoc.replace("/storage/", "/mnt/");
        firstMusicLoc.replace("/sdcard0/", "/sdcard/");
        if (firstMusicLoc.right(1) != "/")
            firstMusicLoc += "/";
        musicPath = QString("%1").arg(firstMusicLoc);
    }

    engine.rootContext()->setContextProperty("musicPath", musicPath);

    QUrl desktopPath;
    const QStringList desktopsLocation = QStandardPaths::standardLocations(QStandardPaths::DesktopLocation);
    if (desktopsLocation.isEmpty())
        desktopPath = appPath;
    else
        desktopPath = QString("%1").arg(desktopsLocation.first());
    engine.rootContext()->setContextProperty("desktopPath", desktopPath);

    QUrl docPath;
    const QStringList docsLocation = QStandardPaths::standardLocations(QStandardPaths::DocumentsLocation);
    if (docsLocation.isEmpty())
        docPath = appPath;
    else
        docPath = QString("%1").arg(docsLocation.first());
    engine.rootContext()->setContextProperty("docPath", docPath);

    ImageHandler* imageHandler = new ImageHandler();

    engine.rootContext()->setContextProperty("ImageHandler", imageHandler);

    qmlRegisterType<FileIO, 1>("FileIO", 1, 0, "FileIO");

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
