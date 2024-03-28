const logger = require("firebase-functions/logger");
const { onDocumentCreated } = require("firebase-functions/v2/firestore");

const admin = require('firebase-admin');
const { FieldValue } = require("firebase-admin/firestore");

admin.initializeApp();

exports.pushNewApp = onDocumentCreated('apps/{docId}', async (event) => {
    const snapshot = event.data;
    if (!snapshot) {
        return;
    }
    const newApp = snapshot.data();
    const ownerId = newApp.ownerId;

    await admin.firestore().collection('users')
        .where('id', '!=', ownerId)
        .get().then(result => {
            result.forEach((doc) => {
                pushNotification(doc.data(), newApp);
            });
        });
});

async function pushNotification(user, newApp) {
    const ownerQuery = admin.firestore().collection('users').doc(newApp.ownerId);
    const owner = (await ownerQuery.get()).data();

    const doc = admin.firestore().collection('users').doc(user.id).collection('notification').doc();
    const notification = {
        'type': 'newApp',
        'id': doc.id,
        'content': '新しいアプリが登録されました',
        'title': '新しいアプリ',
        'iconUrl': newApp.iconUrl,
        'appId': newApp.id,
        'appName': newApp.name,
        'userId': newApp.ownerId,
        'userName': owner.userName,
        'createdAt': FieldValue.serverTimestamp(),
        'read': false,
    };
    await doc.set(notification);

    const body = {
        'type': 'newApp',
        'id': doc.id,
        'content': '新しいアプリが登録されました',
        'title': '新しいアプリ',
        'iconUrl': newApp.iconUrl,
        'appId': newApp.id,
        'appName': newApp.name,
        'userId': newApp.ownerId,
        'userName': owner.userName,
    };

    const payload = {
        token: user.fcmToken,
        notification: {
            title: '新しいアプリ',
            body: '新しいアプリが登録されました'
        },
        data: {
            body: JSON.stringify(body),
        }
    };

    admin.messaging().send(payload);
}
